{ config, pkgs, fl-dots, ... }:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  # programs.mpv = {
  #   enable = true;
  #   config = {
  #     # Video Settings
  #     keep-open= "no";
  #     profile = "gpu-hq";
  #     scale = "ewa_lanczossharp";
  #     cscale = "ewa_lanczossharp";
  #     interpolation = true;
  #     tscale = "oversample";
  #     hwdec = "auto";
  #     vo = "gpu";
  #     gpu-context = "wayland";
  #   };
  # };
  home.packages = [ pkgs.mpv ];
  xdg.configFile."mpv" = {
    source = outOfStore "${dots}/mpv";
    recursive = false;
  };
}
