{ config, pkgs, fl-dots, ... }:

let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  home.packages = [ pkgs.imv ];

  xdg.configFile."imv" = {
    source = outOfStore "${fl-dots}/imv";
    recursive = false;
  };
}
