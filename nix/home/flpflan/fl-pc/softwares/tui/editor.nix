{ tools, ... }:

{
  imports = map tools.relative[
    "home/flpflan/common/cli/nvim"
    "home/flpflan/common/cli/micro"
  ];
  home.sessionVariables.EDITOR = "nvim";
}
