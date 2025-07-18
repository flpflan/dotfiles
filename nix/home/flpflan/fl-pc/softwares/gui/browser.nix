{ pkgs, tools, zen-browser, ... }:

{
  imports = [
    (tools.relative "home/flpflan/common/gui/google-chrome")
  ];
  home.packages = [ zen-browser.packages."${pkgs.system}".default ];
}
