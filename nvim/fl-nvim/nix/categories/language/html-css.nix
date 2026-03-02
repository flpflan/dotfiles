{
  pkgs,
  vim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    # stylelint-lsp
    # biome
    vscode-langservers-extracted
    some-sass-language-server
  ];
  startupPlugins = with vim_pkgs; [
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
