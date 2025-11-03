{ tools, ... }:
let
  inherit (tools) module;
in 
{
  imports = [
    (module "<illogical-impulse>")
  ];
  illogical-impulse = {
      enable = true;

      hyprland = {
          ozoneWayland.enable = true;
      };

      dotfiles = {
          anyrun.enable = true;
          fish.enable = true;
          kitty.enable = false;
      };
  };
}
