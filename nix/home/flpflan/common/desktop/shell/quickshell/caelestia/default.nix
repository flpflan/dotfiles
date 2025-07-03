{ config, lib, pkgs, quickshell, ... }:

let
  qs-caelestia = pkgs.callPackage ./package.nix { inherit quickshell; };
in
{
  home.packages = [ qs-caelestia ];
  xdg.configFile."quickshell/caelestia" = {
    source = pkgs.fetchFromGitHub {
      owner = "liperium";
      repo = "caelestia-shell";
      rev = "ef5f5b6d35b03b5e887857df872c02308bcb2cbc";
      sha256 = "sha256-GHaUs6FXI7lZLpT+VENGe9VyqUdzTjA7FPgGG2A4AXU=";
    };
    recursive = true;
  };
  wayland.windowManager.hyprland.settings.exec-once = lib.mkIf config.wayland.windowManager.hyprland.enable [
    "${qs-caelestia}/bin/qs"
  ];
}
