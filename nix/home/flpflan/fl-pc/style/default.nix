let
  use_stylix = true;
in 
{
  # FIXME: Conflict with illogical-impulse
  imports =
    if use_stylix then
      [./fonts.nix ./theme.nix]
    else
      [./fonts-legacy.nix ./theme-legacy.nix];
  #
  stylix.enable = use_stylix;
  stylix.image = ./background.png;
}
