{
  pkgs,
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    vscode-js-debug
    vtsls
    biome
  ];
  startupPlugins = with vim_pkgs; [
    nvim-vtsls
  ];
  optionalPlugins = with vim_pkgs;
    [
      (nvim-treesitter.withPlugins (
        plugins:
          with plugins; [
            javascript
            typescript
            tsx
            jsdoc
            graphql
          ]
      ))
      package-info-nvim
    ]
    ++ (with nvim_pkgs; [
      ts-error-translator
      # typescript-tools
    ]);
}
