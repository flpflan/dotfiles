{ tools, ... }:

{
  imports = [
    (tools.relative "home/flpflan/common/packages/nvim")
  ];
  home.sessionVariables.VISUAL = "nvim";
}

