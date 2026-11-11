# Framework and library variations

First identify installed versions, the project's source of truth, and any
existing theme or component conventions. These are inspection points, not
instructions to install libraries or combine incompatible stacks.

| Stack | Inspect and maintain |
| --- | --- |
| Angular | Component templates and styles, shared components, global styles and existing CSS custom properties. Follow project conventions for encapsulation and state. |
| Vue | Single-file components, shared components, global CSS and reactive theme/mode handling. Preserve semantic markup in templates. |
| React | Shared components, component styles, theme providers and CSS custom properties. Preserve semantic markup and accessible names in JSX. |
| Ant Design | Existing `ConfigProvider` theme tokens, component overrides and installed version. Map documented design tokens to supported theme APIs rather than editing generated CSS. React Ant Design and Ant Design Vue have distinct APIs; verify the installed package. |
| Tailwind CSS | Existing theme configuration or CSS-based theme declarations for the installed version, utility conventions and plugins. Map tokens to the project's supported theme mechanism, not arbitrary one-off values. |
| Angular Material | Existing Material theming configuration, palettes, typography and component overrides. Follow APIs for the installed Angular Material version; check component states and density. |
| MUI | Existing `ThemeProvider`, `createTheme`, palette, typography and component overrides for the installed version. Reuse themed components and verify light/dark states. |

For each applicable combination, record where tokens live, how `DESIGN.md`
names map to the actual theme, and which component states and modes were checked.
Validate contrast for real foreground/background pairs, not isolated palette
swatches. Avoid claiming a mapping works until checked against the project.

## Mapping workflow

- Angular + Angular Material: inspect the project's Material theme and global
  styles, then map verified roles and component states to that version's theming
  API. Exercise focus, disabled and error states in the existing components.
- Vue + Ant Design Vue: inspect the app-level provider and its existing
  configuration. Map only supported tokens, and check overrides and components
  across configured modes and viewport sizes.
- React + Ant Design: inspect `ConfigProvider` and theme overrides. Check that
  component tokens and state-specific styling follow the installed API.
- React + MUI: inspect the `ThemeProvider` theme and component overrides.
  Map palette roles, typography and shape without bypassing existing providers.
- Tailwind with Angular, Vue or React: inspect the version's theme configuration
  and existing utilities. Map approved design values to the active theme and
  verify rendered markup, focus and responsive variants in that framework.

An illustrative front matter structure for **verified** project values is
shown below. The keys are a local convention, not a standardized validator
schema; use the names and structure the project already uses. The values are
examples only and must not be adopted as the client's brand without approval.

```yaml
tokens:
  colors:
    text: "#111111"
    surface: "#ffffff"
  typography:
    body: "system-ui, sans-serif"
  spacing:
    unit: "4px"
```

In the Markdown body, document the source file for each mapping, actual usage
and tested foreground/background pairs. Do not copy illustrative values into
implementation until verified and approved.
