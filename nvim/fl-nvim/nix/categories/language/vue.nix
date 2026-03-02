{
  pkgs,
  vim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    vue-language-server
  ];
  startupPlugins = with vim_pkgs; [
    (nvim-treesitter.withPlugins (
      plugins:
        with plugins; [
          vue
        ]
    ))
    # TODO: vue-goto-definition.nvim
  ];
}
