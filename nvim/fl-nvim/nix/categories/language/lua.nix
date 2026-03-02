{
  pkgs,
  vim_pkgs,
  nvim_pkgs,
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
  optionalPlugins = with nvim_pkgs; [
    lazydev
  ];
}
