{ config, pkgs, fl-dots, ... }:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  home.packages = with pkgs; [ zathura ];

  xdg.configFile."zathura" = {
    source = outOfStore "${dots}/zathura";
    recursive = false;
  };
}
