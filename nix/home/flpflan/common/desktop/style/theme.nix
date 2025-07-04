{ pkgs, lib, ... }:

{
  # Color Scheme
  stylix.polarity = "dark";
  specialisation.light-scheme.configuration = {
    stylix.polarity = lib.mkForce "light";
  };

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
