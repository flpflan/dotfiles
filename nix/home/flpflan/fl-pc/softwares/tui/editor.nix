{ tools, ... }:

{
  imports = [
    (tools.relative "home/flpflan/common/tui/nvim")
  ];
  home.sessionVariables.EDITOR = "nvim";
}
