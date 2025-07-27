{ config, pkgs, fl-dots, ... }:

let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = [ pkgs.google-chrome ];
  xdg.configFile."chrome-flags.conf".source = outOfStore "${fl-dots}/chrome-flags.conf";
}
