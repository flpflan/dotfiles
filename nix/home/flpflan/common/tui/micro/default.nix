{ config, pkgs, fl-dots, ... }:

let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  home.packages = [ pkgs.micro ];
  xdg.configFile."micro".source = outOfStore "${fl-dots}/micro";
}
