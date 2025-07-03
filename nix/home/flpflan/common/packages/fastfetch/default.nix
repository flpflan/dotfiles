{ config, pkgs, fl-dots,  ...}:

let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  home.packages = [
    pkgs.fastfetch.override {
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
    }
  ];
  xdg.configFile."fastfetch" = {
    source = outOfStore "${fl-dots}/fastfetch";
    recursive = true;
  };
}
