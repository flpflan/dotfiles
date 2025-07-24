{ config, fl-dots, ... }:

let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  services.hypridle = {
    enable = true;
    importantPrefixes = outOfStore "${fl-dots}/hypr/hypridle.conf";
  };
}
