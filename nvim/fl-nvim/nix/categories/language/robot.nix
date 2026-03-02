{
  pkgs,
  vim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    # TODO: add lsp
  ];
  startupPlugins = with vim_pkgs; [
    (nvim-treesitter.withPlugins (
      plugins:
        with plugins; [
          robot
        ]
    ))
  ];
}
