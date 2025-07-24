{ tools, ... }:

{
  imports = map tools.relative[
    "home/flpflan/common/tui/nvim"
    "home/flpflan/common/tui/micro"
  ];
  home.sessionVariables.EDITOR = "nvim";
}
