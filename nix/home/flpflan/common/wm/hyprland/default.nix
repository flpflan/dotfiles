{ config, fl-dots, caelestia-dots, ... }:

let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;

  variables = import ./variables.nix;
  animations = import ./animations.nix;
  decoration = import ./decoration.nix;
  keybinds = import ./keybinds.nix;
  execs = import ./execs.nix;
in
{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.xwayland.enable = true;
  wayland.windowManager.hyprland.settings = variables // {
    monitor = [
      ", preferred, auto, 1"
    ];
  } // animations // decoration // keybinds // execs;
  wayland.windowManager.hyprland.extraConfig = ''
    source = ${fl-dots}/hypr/hyprland.conf
  '';

  xdg.configFile = {
    "hypr/hyprland".source = outOfStore "${caelestia-dots}/hypr/hyprland";
    "hypr/scripts".source = outOfStore "${caelestia-dots}/hypr/scripts";
    "hypr/scheme".source = outOfStore "${caelestia-dots}/hypr/scheme";
  };
}
