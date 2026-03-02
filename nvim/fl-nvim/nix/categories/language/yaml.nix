{
  pkgs,
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    nodejs
    yaml-language-server
    prettierd
  ];
  startupPlugins = with vim_pkgs; [
    SchemaStore-nvim
    (nvim-treesitter.withPlugins (
      plugins:
        with plugins; [
          yaml
        ]
    ))
  ];
  optionalPlugins = with nvim_pkgs; [
    yaml
    keytrail
  ];
}
