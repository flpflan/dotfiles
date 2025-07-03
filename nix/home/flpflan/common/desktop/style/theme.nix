{ pkgs, lib, ... }:

{
  # Color Scheme
  stylix.polarity = "dark";
  specialisation.light-scheme.configuration = {
    stylix.polarity = lib.mkForce "light";
  };
  # dconf = {
  #   settings = {
  #     "org/gnome/desktop/interface" = {
  #  gtk-theme = "Adwaita-dark";
  #  color-scheme = "prefer-dark";
  #     };
  #   };
  # };

  # Cursor
  stylix.cursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 16;
  };

  # Icon
  stylix.iconTheme = {
    enable = true;
    package = pkgs.adwaita-icon-theme;
    light = "Adwaita";
    dark = "Adwaita-dark";
  };

  # GTK
  stylix.targets.gtk = {
    enable = true;
  };

  # QT
  stylix.targets.qt = {
    enable = true;
  };
}
