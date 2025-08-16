{
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  startupPlugins = with vim_pkgs; [
    nvim-nio
  ];
  optionalPlugins = with vim_pkgs;
    [
      nvim-dap
      nvim-dap-ui
      nvim-dap-virtual-text
      (nvim-treesitter.withPlugins (
        plugins:
          with plugins; [
            # dap_repl # BUG: This not possible on nixos
          ]
      ))
    ]
    ++ (with nvim_pkgs; [
      nvim-dap-repl-highlights
    ]);
}
