{ config, pkgs, ... }:

{
  stylix.fonts = {
    emoji = {
      package = pkgs.noto-fonts-color-emoji;
      name = "Noto Color Emoji";
    };
    monospace = {
      package = pkgs.nerd-fonts.fira-code;
      name = "FiraCode Nerd Font";
    };
    sansSerif = {
      package = pkgs.merriweather-sans;
      name = "Merriweather Sans";
    };
    serif = {
      package = pkgs.merriweather;
      name = "Merriweather";
    };
  };

  stylix.fonts.sizes = {
    applications = 12;
    desktop = 10;
    popups = config.stylix.fonts.sizes.desktop;
    terminal = config.stylix.fonts.sizes.applications;
  };
}
