{
  pkgs,
  vim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    nodejs
    yaml-language-server
    prettierd
  ];
  optionalPlugins = with vim_pkgs; [
    (nvim-treesitter.withPlugins (
      plugins:
        with plugins; [
          yaml
        ]
    ))
    SchemaStore-nvim
  ];
}
