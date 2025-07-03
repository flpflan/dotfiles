{ pkgs, tools, zen-browser, ... }:

{
  imports = [
    (tools.relative "home/flpflan/common/packages/google-chrome")
  ];
  home.packages = [ zen-browser.packages."${pkgs.system}".default ];
}
