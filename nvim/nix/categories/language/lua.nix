{
  pkgs,
  vim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    lua-language-server
    # selene
    stylua
  ];
  startupPlugins = with vim_pkgs; [
    (nvim-treesitter.withPlugins (
      plugins:
        with plugins; [
          lua
          luadoc
          luap
          luau
        ]
    ))
  ];
  optionalPlugins = with vim_pkgs; [
    lazydev-nvim
  ];
}
