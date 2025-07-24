{ pkgs, ... }:

{
  home.pkgs = with pkgs; [
    adw-gtk3 papirus-icon-theme
  ];
}
