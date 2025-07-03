{ pkgs, zen-browser, ... }:

{
  home.packages = with pkgs; [ google-chrome zen-browser.packages."${pkgs.system}".default ];
}
