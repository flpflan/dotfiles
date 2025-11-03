{ config, pkgs, fl-dots, ... }:

let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  home.packages = [ pkgs.btop ];
  xdg.configFile."btop".source = outOfStore "${fl-dots}/btop";
}
