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
    ]
    ++ (with nvim_pkgs; [
      copilot
      codecompanion
      copilot-lualine
    ]);
}
