{ config, fl-dots, ... }:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  services.hypridle = {
    enable = false;
  };

  xdg.configFile."hypr/hypridle.conf".source = outOfStore "${dots}/hypr/hypridle.conf";
}
