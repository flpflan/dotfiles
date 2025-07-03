{ tools, ... }:

{
  imports = [
    (tools.relative "home/flpflan/common/packages/zsh")
  ];
  home.sessionVariables.SHELL = "zsh";
}
