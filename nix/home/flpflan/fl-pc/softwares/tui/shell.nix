{ tools, ... }:

{
  imports = map tools.relative [
    "home/flpflan/common/tui/fish"
    "home/flpflan/common/tui/starship"
  ];
  home.sessionVariables.SHELL = "fish";
}
