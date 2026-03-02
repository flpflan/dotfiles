{
  pkgs,
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    vscode-js-debug
    # vtsls
    # biome
  ];
  startupPlugins = with vim_pkgs;
    [
      # nvim-vtsls
      (nvim-treesitter.withPlugins (
        plugins:
          with plugins; [
            javascript
            typescript
            tsx
            jsdoc
            graphql
            http
            sql
          ]
      ))
    ]
    ++ (with nvim_pkgs; [
      typescript-tools
    ]);
  optionalPlugins = with vim_pkgs;
    [
      package-info-nvim
    ]
    ++ (with nvim_pkgs; [
      ts-error-translator
    ]);
}
