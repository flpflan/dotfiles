{
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  startupPlugins = with vim_pkgs;
    [
      # transparent-nvim
      catppuccin-nvim
    ]
    ++ (with nvim_pkgs; [
      sweetie
      daylight
    ]);
}
