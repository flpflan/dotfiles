{ config, pkgs, tools, fl-dots, ... }:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  home.packages = with pkgs; [niri];

  xdg.configFile."niri".source = outOfStore "${dots}/niri";

  # imports = [(tools.relative "<niri-home-manager>")];
  #
  # programs.niri = {
  #   enable = true;
  #   package = pkgs.niri;
  # };
}
