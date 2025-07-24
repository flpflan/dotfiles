{ pkgs, ... }:

{
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
    gtk.enable = true;
    # x11.enable = true;
    hyprcursor.enable = true;
    dotIcons = false;
  };

  gtk = {
    enable = true;
    #
    # theme = {
    #   package = pkgs.flat-remix-gtk;
    #   name = "Flat-Remix-GTK-Grey-Darkest";
    # };

    iconTheme = {
      package = pkgs.papirus-icon-theme.override { color = "black"; };
      name = "Papirus-Dark";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };
  # gtk = {
  #   # enable = true;
  #   theme = {
  #     name = "Adwaita-dark";
  #     package = pkgs.tokyonight-gtk-theme;
  #   };
  #   iconTheme = {
  #     name = "Papirus-Dark";
  #     package = pkgs.papirus-icon-theme;
  #   };
  #   cursorTheme = {
  #     name = "Adwaita";
  #     package = pkgs.adwaita-icon-theme;
  #     size = 24;
  #   };
  #   font = {
  #     name = "Iosevka Nerd Font";
  #   };
  #   gtk3.extraConfig = {
  #     Settings = ''
  #       gtk-application-prefer-dark-theme=1
  #     '';
  #   };
  #   gtk4.extraConfig = {
  #     Settings = ''
  #       gtk-application-prefer-dark-theme=1
  #     '';
  #   };
  # };
}
