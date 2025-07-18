{ tools, ... }:

{
  imports = [
    (tools.relative "home/flpflan/common/tui/zsh")
  ];
  home.sessionVariables.SHELL = "zsh";
}
