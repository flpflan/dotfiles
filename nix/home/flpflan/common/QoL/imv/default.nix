{ config, pkgs, fl-dots, ... }:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  home.packages = [ pkgs.imv ];

  xdg.configFile."imv" = {
    source = outOfStore "${dots}/imv";
    recursive = false;
  };
}
