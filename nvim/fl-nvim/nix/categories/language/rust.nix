{
  pkgs,
  vim_pkgs,
  ...
}: let
in {
  lspsAndRuntimeDeps = with pkgs; [
    rust-analyzer
    clippy
    rustfmt
    codelldb
  ];
  # startupPlugins = with vim_pkgs; [
  # TODO:  rustaceanvim
  # ];
  optionalPlugins = with vim_pkgs; [
    (nvim-treesitter.withPlugins (
      plugins:
        with plugins; [
          rust
        ]
    ))
    crates-nvim
  ];
}
