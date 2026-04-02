{
  pkgs,
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    # TODO: vscode-json-languageserver
    vscode-langservers-extracted
    prettierd
  ];
  startupPlugins = with vim_pkgs; [
    SchemaStore-nvim
    (nvim-treesitter.withPlugins (
      plugins:
        with plugins; [
          json
          # jsonc
          json5
        ]
    ))
  ];
  optionalPlugins = with nvim_pkgs; [
    keytrail
  ];
}
