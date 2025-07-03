{ config, fl-dots, ... }:

let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  programs.foot = {
    enable = true;
    settings = {
      "" = {
        include = "${outOfStore "${fl-dots}/foot"}";
      };
      # main = {
        # include = ["${outOfStore "${fl-dots}/foot"}"];
      # };
    };
  };
}
