{ pkgs, ... }:

{
  services.cliphist = {
    enable = true;
    allowImages = true;
  };
  home.packages = [ pkgs.wl-clipboard ];
}
