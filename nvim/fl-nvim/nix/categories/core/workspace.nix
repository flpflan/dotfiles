{
  # vim_pkgs,
  nvim_pkgs,
  ...
}: {
  # startupPlugins = with vim_pkgs; [
  #   project-nvim
  # ];
  optionalPlugins = with nvim_pkgs; [
    exrc
  ];
}
