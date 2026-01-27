{ config, pkgs, fl-dots,  ...}:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
  fastfetch = pkgs.fastfetch.override {
    audioSupport = false;
    brightnessSupport = false;
    dbusSupport = false;
    flashfetchSupport = false;
    terminalSupport = false;
    gnomeSupport = false;
    imageSupport = true;
    openclSupport = false;
    openglSupport = false;
    rpmSupport = false;
    sqliteSupport = true;
    vulkanSupport = false;
    waylandSupport = false;
    x11Support = false;
    xfceSupport = false;
    zfsSupport = false;
  };
in 
{
  home.packages = [
    fastfetch
  ];
  xdg.configFile."fastfetch" = {
    source = outOfStore "${dots}/fastfetch";
    recursive = false;
  };
}
