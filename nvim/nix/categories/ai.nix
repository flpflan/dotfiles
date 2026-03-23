{
  pkgs,
  vim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    claude-code
    opencode
  ];
  optionalPlugins = with vim_pkgs;
    [
      opencode-nvim
      copilot-lua
      copilot-lualine
    ];
}
