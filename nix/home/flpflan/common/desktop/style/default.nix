{ config, ... }:

{
  imports =
    if config.stylix.enable then
      [./fonts.nix ./theme.nix]
    else
      [./fonts-legacy.nix ./theme-legacy.nix];

  stylix.enable = true;
  stylix.image = ./background.png;
}
