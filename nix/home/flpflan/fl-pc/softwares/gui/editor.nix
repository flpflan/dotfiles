{tools, ...}: {
  imports = [
    (tools.relative "home/flpflan/common/tui/nvim")
  ];

  programs.neovide.enable = true;

  home.sessionVariables.VISUAL = "neovide";
}
