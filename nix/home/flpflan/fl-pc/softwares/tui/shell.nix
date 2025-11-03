{ tools, ... }:

{
  imports = map tools.relative [
    "home/flpflan/common/cli/fish"
    "home/flpflan/common/cli/starship"
  ];
  home.sessionVariables.SHELL = "fish";
}
