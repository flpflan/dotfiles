{
  config,
  fl-dots,
  ...
}: let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;

  variables = import ./variables.nix;
  animations = import ./animations.nix;
  decoration = import ./decoration.nix;
  keybinds = import ./keybinds.nix;
  execs = import ./execs.nix;
  envs = import ./envs.nix;
in {
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.xwayland.enable = true;
  wayland.windowManager.hyprland.settings =
    variables
    // {
      monitor = [
        ", preferred, auto, 1"
      ];
    }
    // animations // decoration // keybinds // execs // envs;
  wayland.windowManager.hyprland.extraConfig = ''
    source = ${fl-dots}/hypr/hyprland.conf
  '';

  xdg.configFile = {
    "hypr/hyprland".source = outOfStore "${fl-dots}/hypr/hyprland";
    "hypr/scripts".source = outOfStore "${fl-dots}/hypr/scripts";
    "hypr/scheme".source = outOfStore "${fl-dots}/hypr/scheme";
    "hypr/variables.conf".source = outOfStore "${fl-dots}/hypr/variables.conf";
  };
}
