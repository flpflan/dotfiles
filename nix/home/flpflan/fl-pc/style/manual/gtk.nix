{ pkgs, fl-dots, ... }:

{
  home.packages = with pkgs; [
    adw-gtk3 papirus-icon-theme
  ];

  xdg.configFile."gtk-4.0/settings.ini".source = "${fl-dots}/gtk-4.0/settings.ini";
  xdg.configFile."gtk-3.0/settings.ini".source = "${fl-dots}/gtk-3.0/settings.ini";
}
