{
  pkgs,
  vim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    nodejs
  ];
  optionalPlugins = with vim_pkgs;
    [
      opencode-nvim
      copilot-lua
      copilot-lualine
    ];
}
