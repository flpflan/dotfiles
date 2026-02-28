{ config, pkgs, fl-dots, ... }:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  home.packages = with pkgs; [go-musicfox];

  xdg.configFile."go-musicfox/config.toml" = {
    source = outOfStore "${dots}/go-musicfox/config.toml";
    recursive = false;
  };
}
