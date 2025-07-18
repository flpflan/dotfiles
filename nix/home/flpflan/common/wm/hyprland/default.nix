let
  animations = import ./animations.nix;
  decoration = import ./decoration.nix;
  keybinds = import ./keybinds.nix;
  execs = import ./execs.nix;
in
{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.xwayland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$TERM" = "foot";
    "$webBrowser" = "google-chrome-stable";

    monitor = [
      ", preferred, auto, 1"
    ];
  } // animations // decoration // keybinds // execs;
}
