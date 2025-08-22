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
  ];
  optionalPlugins = with vim_pkgs;
    [
      (nvim-treesitter.withPlugins (
        plugins:
          with plugins; [
            yaml
          ]
      ))
    ]
    ++ (with nvim_pkgs; [
      yaml
    ]);
}
