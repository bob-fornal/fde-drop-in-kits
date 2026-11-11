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
