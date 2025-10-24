{tools, ...}: {
  imports = [
    (tools.relative "home/flpflan/common/tui/nvim")
    (tools.relative "home/flpflan/common/apps/vscode")
  ];

  programs.neovide.enable = true;

  home.sessionVariables.VISUAL = "neovide";
}
