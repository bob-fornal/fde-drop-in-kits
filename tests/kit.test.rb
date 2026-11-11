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
        File.read(path).scan(%r{`/([a-z0-9-]+)`}).flatten.each do |reference|
          assert File.file?(File.join(ROOT, kit, ".claude/skills", reference, "SKILL.md")),
                 "#{path}: missing skill #{reference}"
        end
        File.read(path).scan(%r{\.claude/skills/[a-z0-9-]+/[a-zA-Z0-9_./-]+}).each do |reference|
          assert File.file?(File.join(ROOT, kit, reference)), "#{path}: missing #{reference}"
        end
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
    assert_empty files("copilot/agent-templates/*.md").reject { |p| p.end_with?(".agent.md") }
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
      fixture = File.expand_path(scenario.fetch("fixture"), ROOT)
      assert fixture.start_with?(File.join(ROOT, "tests/fixtures/")), "Fixture outside tests/fixtures"
      assert Dir.exist?(fixture), "Missing fixture: #{fixture}"
      KITS.each do |kit|
        assert File.file?(File.join(ROOT, kit, ".claude/skills", scenario.fetch("skill"), "SKILL.md"))
      end
    end
    assert_equal ids.length, ids.uniq.length
  end

  def test_documentation_skill_contract_and_workflow_integration
    KITS.each do |kit|
      skill = File.join(ROOT, kit, ".claude/skills/document-slices/SKILL.md")
      assert File.file?(skill), "Missing documentation skill in #{kit}"
      body = File.read(skill)
      %w[vertical symbol intent revision stale].each { |term| assert_includes body.downcase, term }
      assert_match(/line|position/i, body)
      %w[onboard implement-issue wrapup].each do |workflow|
        assert_includes File.read(File.join(ROOT, kit, ".claude/skills", workflow, "SKILL.md")), "`/document-slices`"
      end
      assert_includes File.read(File.join(ROOT, kit, "AGENTS.md")), "agent"
    end
    assert JSON.parse(File.read(File.join(ROOT, "tests/scenarios.eval.json"))).any? { |s| s["skill"] == "document-slices" }
  end

  def test_slice_example_references_fixture_symbols
    path = File.join(ROOT, "claude/.claude/skills/document-slices/references/slice.schema.md")
    match = File.read(path).match(/```yaml\n---\n(.*?)\n---\n```/m)
    refute_nil match
    document = YAML.safe_load(match[1], permitted_classes: [], aliases: false)
    document.fetch("entries").each do |entry|
      source = File.readlines(File.join(ROOT, "tests/fixtures/legacy-app", entry.fetch("path")))
      first, last = entry.fetch("lines").split("-").map(&:to_i)
      assert first.positive? && first <= last && last <= source.length, entry.inspect
      assert_includes source[(first - 1)..(last - 1)].join, entry.fetch("symbol").split(".").last
      assert_equal "#{entry.fetch("path")}:#{entry.fetch("lines")}", entry.fetch("evidence")
    end
  end
end
