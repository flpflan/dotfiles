{
  pkgs,
  vim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    # stylelint-lsp
    # biome
    vscode-langservers-extracted
  ];
  optionalPlugins = with vim_pkgs; [
    (nvim-treesitter.withPlugins (
      plugins:
        with plugins; [
          html
          css
          scss
        ]
    ))
  ];
}
