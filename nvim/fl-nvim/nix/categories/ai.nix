{
  pkgs,
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    nodejs
  ];
  optionalPlugins = with vim_pkgs;
    [
      opencode-nvim
    ]
    ++ (with nvim_pkgs; [
      copilot
      copilot-lualine
    ]);
}
