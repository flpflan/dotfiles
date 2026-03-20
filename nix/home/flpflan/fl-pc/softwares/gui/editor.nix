{tools, ...}: {
  imports = [
    (tools.relative "home/flpflan/common/cli/nvim")
    # (tools.relative "home/flpflan/common/apps/vscode")
  ];

  programs.neovide.enable = true;

  home.sessionVariables.VISUAL = "neovide";
}
