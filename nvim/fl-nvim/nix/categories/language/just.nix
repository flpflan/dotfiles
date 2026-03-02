{
  pkgs,
  vim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    just-lsp
  ];
  startupPlugins = with vim_pkgs; [
    (nvim-treesitter.withPlugins (
      plugins:
        with plugins; [
          just
        ]
    ))
  ];
}
