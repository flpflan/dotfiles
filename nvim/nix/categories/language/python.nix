{
  pkgs,
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    # basedpyright
    ty
    ruff
    fd
  ];
  startupPlugins = with vim_pkgs; [
    (nvim-treesitter.withPlugins (
      plugins:
        with plugins; [
          python
        ]
    ))
  ];
  optionalPlugins = with vim_pkgs;
    [
      nvim-dap-python
      venv-selector-nvim
    ];
}
