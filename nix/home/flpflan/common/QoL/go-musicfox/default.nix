{ config, pkgs, fl-dots, ... }:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  home.packages = with pkgs; [go-musicfox];

  xdg.configFile."go-musicfox/go-musicfox.ini" = {
    source = outOfStore "${dots}/go-musicfox/go-musicfox.ini";
    recursive = false;
  };
}
