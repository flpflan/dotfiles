{ illogical-impulse, ... }:

{
  imports = [
    illogical-impulse.homeManagerModules.default
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
