{ config, fl-dots, ... }:

let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  programs.foot = {
    enable = true;
    # settings = {
    #   main = {
    #     term = "xterm-256color";
    #
    #     font = "Fira Code:size=11";
    #     dpi-aware = "yes";
    #   };
    #
    #   mouse = {
    #     hide-when-typing = "yes";
    #   };
    # };
  };
  xdg.configFile."foot" = {
    source = outOfStore "${fl-dots}/foot";
    recursive = true;
  };
}
