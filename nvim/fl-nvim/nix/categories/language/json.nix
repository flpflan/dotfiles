{
  pkgs,
  vim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    # vscode-json-languageserver
    nodePackages_latest.vscode-json-languageserver
    prettierd
  ];
  startupPlugins = with vim_pkgs; [
    SchemaStore-nvim
  ];
  optionalPlugins = with vim_pkgs; [
    (nvim-treesitter.withPlugins (
      plugins:
        with plugins; [
          json
          jsonc
        ]
    ))
  ];
}
