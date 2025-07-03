let
  enable_stylix = true;
in 
{
  imports =
    if enable_stylix then
      [./fonts.nix ./theme.nix]
    else
      [./fonts-legacy.nix ./theme-legacy.nix];

  stylix.enable = enable_stylix;
  stylix.image = ./background.png;

  stylix.targets.gnome.enable = false;
}
