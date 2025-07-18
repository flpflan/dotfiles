{ 
  config,
  lib,
  pkgs,
  caelestia-shell,
  ...
}:

let
  # qs-caelestia = pkgs.callPackage ./package.nix { inherit quickshell; };
  qs-caelestia = caelestia-shell.packages."${pkgs.system}".default.override { withCli = true; };
in
{
  home.packages = [
    qs-caelestia
  ];
  wayland.windowManager.hyprland.settings.exec-once = lib.mkIf config.wayland.windowManager.hyprland.enable [
    "${qs-caelestia}/bin/caelestia-shell"
  ];
}
