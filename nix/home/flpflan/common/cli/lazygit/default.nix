{ config, pkgs, fl-dots, ... }:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  home.packages = [ pkgs.lazygit ];
  xdg.configFile."lazygit".source = outOfStore "${dots}/lazygit";
}
