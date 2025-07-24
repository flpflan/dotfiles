{ tools, ... }:

{
  imports = map tools.relative [
    "home/flpflan/common/tui/zsh"
    "home/flpflan/common/tui/starship"
  ];
  home.sessionVariables.SHELL = "zsh";
}
