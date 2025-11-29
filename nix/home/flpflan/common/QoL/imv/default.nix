{ config, pkgs, fl-dots, ... }:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  home.packages = [
    # (pkgs.imv.override {
    #   withWindowSystem = "wayland"; # FIXME: cannot build
    # })
    pkgs.imv
  ];

  xdg.configFile."imv" = {
    source = outOfStore "${dots}/imv";
    recursive = false;
  };
  xdg.dataFile = {
    "applications/imv.desktop".source = ./imv.desktop;
    "applications/imv-dir.desktop".source = ./imv-dir.desktop;
  };
}
