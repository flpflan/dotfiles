{
  pkgs,
  vim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    rust-analyzer
    clippy
    rustfmt
    codelldb
  ];
  startupPlugins = with vim_pkgs; [
    rustaceanvim
  ];
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
