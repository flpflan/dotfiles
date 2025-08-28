{
  pkgs,
  vim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    clang-tools
    neocmakelsp
  ];
  startupPlugins = with vim_pkgs; [
    clangd_extensions-nvim
    cmake-tools-nvim
  ];
  optionalPlugins = with vim_pkgs; [
    (nvim-treesitter.withPlugins (
      plugins:
        with plugins; [
          asm
          nasm
          c
          cpp
          make
          cmake
        ]
    ))
  ];
}
