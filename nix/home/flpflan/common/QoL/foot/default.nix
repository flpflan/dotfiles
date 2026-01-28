{ config, pkgs, fl-dots, ... }:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  home.packages = [ pkgs.foot ];
  xdg.configFile."foot".source = outOfStore "${dots}/foot";
}
