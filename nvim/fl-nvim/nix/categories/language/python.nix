{
  pkgs,
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    basedpyright
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
    ]
    ++ (with nvim_pkgs; [
      venv-selector
    ]);
}
