{ pkgs, fl-dots, ... }:

{
  home.packages = with pkgs; [
    adw-gtk3 papirus-icon-theme
  ];

  xdg.configFile."gtk-4.0/settings.ini" = "${fl-dots}/gtk-4.0/settings.ini";
}
