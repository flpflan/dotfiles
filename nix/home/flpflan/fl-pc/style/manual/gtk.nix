{ pkgs, ... }:

{
  home.packages = with pkgs; [
    adw-gtk3 papirus-icon-theme nwg-look
  ];
}
