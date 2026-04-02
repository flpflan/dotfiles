{
  pkgs,
  vim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    # stylelint-lsp
    # biome
    #TODO: vscode-css-languageserver vscode-html-languageserver
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
