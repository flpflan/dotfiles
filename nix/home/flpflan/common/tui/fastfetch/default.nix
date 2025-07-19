{ config, pkgs, fl-dots,  ...}:

let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
  fastfetch = pkgs.fastfetch.override {
    audioSupport = false;
    brightnessSupport = true;
    dbusSupport = true;
    flashfetchSupport = false;
    terminalSupport = true;
    gnomeSupport = false;
    imageSupport = true;
    openclSupport = false;
    openglSupport = false;
    rpmSupport = false;
    sqliteSupport = false;
    vulkanSupport = true;
    waylandSupport = true;
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
    source = outOfStore "${fl-dots}/fastfetch";
    recursive = false;
  };
}
