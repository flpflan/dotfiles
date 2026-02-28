{ pkgs, config, fl-dots, ... }:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  # services.hypridle = {
  #   enable = true;
  # };

  # xdg.configFile."hypr/hypridle.conf".source = outOfStore "${dots}/hypr/hypridle.conf";

  home.packages = with pkgs; [swayidle];
}
