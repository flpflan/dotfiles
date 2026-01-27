{pkgs, tools, ...}: {

  imports = map tools.relative [
    "home/flpflan/common/cli/lazygit"
  ];

  home.packages = with pkgs; [
    jq
    (ouch.override {enableUnfree = true;})
  ];
}
