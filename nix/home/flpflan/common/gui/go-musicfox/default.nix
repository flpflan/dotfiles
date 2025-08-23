{ config, pkgs, fl-dots, ... }:

let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  home.packages = with pkgs; [go-musicfox];

  xdg.configFile."go-musicfox/go-musicfox.ini" = {
    source = outOfStore "${fl-dots}/go-musicfox/go-musicfox.ini";
    recursive = false;
  };
}
