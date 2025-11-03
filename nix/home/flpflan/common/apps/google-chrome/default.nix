{ config, pkgs, fl-dots, ... }:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = [ pkgs.google-chrome ];
  xdg.configFile."chrome-flags.conf".source = outOfStore "${dots}/chrome-flags.conf";
}
