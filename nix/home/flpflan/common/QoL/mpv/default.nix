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
  home.packages = [
    (pkgs.mpv.override {
      mpv-unwrapped = pkgs.mpv-unwrapped.override {
        x11Support = false;
        alsaSupport = false;
        pulseSupport = false;
        pipewireSupport = true;
        javascriptSupport = false;
      };
    })
  ];
  xdg.configFile."mpv" = {
    source = outOfStore "${dots}/mpv";
    recursive = false;
  };
}
