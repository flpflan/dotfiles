{ 
  pkgs,
  caelestia-cli,
  ...
}:

let
  # qs-caelestia = pkgs.callPackage ./package.nix { inherit quickshell; };
  caelestia = caelestia-cli.packages."${pkgs.system}".default.override { withShell = true; };
in
{
  home.packages = [
    caelestia
  ];
  # wayland.windowManager.hyprland.settings.exec-once = lib.mkIf config.wayland.windowManager.hyprland.enable [
  #   "caelestia shell"
  # ];
}
