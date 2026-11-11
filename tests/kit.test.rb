require "minitest/autorun"
require "yaml"
require "json"
require "set"

ROOT = File.expand_path("..", __dir__)
KITS = %w[claude copilot].freeze

class KitTest < Minitest::Test
  def files(glob)
    Dir.glob(File.join(ROOT, glob)).sort
  end

  def metadata(path)
    match = File.read(path).match(/\A---\r?\n(.*?)\r?\n---\r?\n/m)
    refute_nil match, "Missing front matter: #{path}"
    data = YAML.safe_load(match[1], permitted_classes: [], aliases: false)
    assert_kind_of Hash, data, path
    data
  end

  def test_skills_have_unique_valid_metadata
    KITS.each do |kit|
      names = []
      skills = files("#{kit}/.claude/skills/*/SKILL.md")
      refute_empty skills
      skills.each do |path|
        data = metadata(path)
        name = data["name"]
        assert_match(/\A[a-z0-9]+(?:-[a-z0-9]+)*\z/, name.to_s, path)
        assert_equal File.basename(File.dirname(path)), name
        assert_kind_of String, data["description"], path
        refute_empty data["description"].strip
        names << name
      end
      assert_equal names.length, names.uniq.length, "Duplicate skill names in #{kit}"
    end
  end

  def test_skill_trees_match
    trees = KITS.map do |kit|
      base = File.join(ROOT, kit, ".claude/skills")
      Dir.glob("#{base}/**/*", File::FNM_DOTMATCH).select { |p| File.file?(p) }
        .to_h { |path| [path.delete_prefix("#{base}/"), File.binread(path)] }
    end
    assert_equal trees[0], trees[1]
  end

  def test_agents_and_referenced_skills
    {
      "claude" => "claude/.claude/agents/*.agent.md",
      "copilot" => "copilot/agent-templates/*.agent.md"
    }.each do |kit, pattern|
      agents = files(pattern)
      refute_empty agents
      names = agents.map do |path|
        data = metadata(path)
        assert_kind_of String, data["name"], path
        refute_empty data["name"].strip
        assert_kind_of String, data["description"], path
        refute_empty data["description"].strip
        assert data["tools"], "Missing tool declaration: #{path}"
        File.read(path).scan(%r{\.claude/skills/[a-z0-9-]+/SKILL\.md}).each do |reference|
          assert File.file?(File.join(ROOT, kit, reference)), "#{path}: missing #{reference}"
        end
        data["name"]
      end
      assert_equal names.length, names.uniq.length, "Duplicate agent names in #{kit}"
    end
    assert_empty files("claude/.claude/agents/*.md").reject { |p| p.end_with?(".agent.md") }
  end

  def test_local_markdown_links
    markdown = files("{README.md,AGENTS.md,claude/**/*.md,copilot/**/*.md,claude/.claude/**/*.md,copilot/.claude/**/*.md}")
    markdown.each do |path|
      File.read(path).scan(/\]\(([^)]+)\)/).flatten.each do |target|
        next if target.match?(/\A(?:[a-z][a-z0-9+.-]*:|#)/i)
        relative = target.split("#", 2).first
        assert File.exist?(File.expand_path(relative, File.dirname(path))), "#{path}: broken link #{target}"
      end
    end
  end

  def test_scenario_metadata_references_existing_skills
    scenarios = JSON.parse(File.read(File.join(ROOT, "tests/scenarios.eval.json")))
    refute_empty scenarios
    ids = []
    scenarios.each do |scenario|
      ids << scenario.fetch("id")
      refute_empty scenario.fetch("prompt")
      refute_empty scenario.fetch("evidence")
      KITS.each do |kit|
        assert File.file?(File.join(ROOT, kit, ".claude/skills", scenario.fetch("skill"), "SKILL.md"))
      end
    end
    assert_equal ids.length, ids.uniq.length
  end
end
