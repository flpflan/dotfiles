{ config, fl-dots, ... }:

let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  services.hypridle = {
    enable = true;
  };

  xdg.configFile."hypr/hypridle.conf".source = outOfStore "${fl-dots}/hypr/hypridle.conf";
}
