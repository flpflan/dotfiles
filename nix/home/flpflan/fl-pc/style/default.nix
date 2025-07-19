let
  scheme = "manual";
in 
{
  # FIXME: Conflict with illogical-impulse
  imports =
    if scheme == "stylix" then
      [./fonts-stylix.nix ./theme-stylix.nix]
    # else if scheme == "legacy" then
    #   [./fonts.nix ./theme.nix]
    else
      [./fonts.nix];
  #
  stylix.enable = (scheme == "stylix");
  stylix.image = ./background.png;
}
