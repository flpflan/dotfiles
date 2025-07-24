let
  scheme = "manual";
in 
{
  imports =
    if scheme == "stylix" then
      [ ./stylix ]
    else if scheme == "legacy" then
      [ ./fonts.nix ./legacy ]
    else
      [ ./fonts.nix ];
}
