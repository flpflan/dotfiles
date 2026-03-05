{pkgs, tools, agenix, ...}: {

  imports = map tools.relative [
    "home/flpflan/common/cli/lazygit"
  ];

  home.packages = with pkgs; [
    jq
    (ouch.override {enableUnfree = true;})
    agenix.packages.x86_64-linux.default
  ];
}
