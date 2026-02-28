{ config, tools, fl-dots, ... }:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  imports = [
    (tools.relative "<noctalia-home-manager>")
  ];

  programs.noctalia-shell = {
    enable = true;
    systemd.enable = false;
  };

  xdg.configFile."noctalia".source = outOfStore "${dots}/noctalia";
}
