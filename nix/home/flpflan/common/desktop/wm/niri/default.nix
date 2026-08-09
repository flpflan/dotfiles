{
  config,
  fl-dots,
  ...
}:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in
{
  wayland.windowManager.niri = {
    enable = true;
    portalPackage = null;
    systemd.enable = false;
  };

  xdg.configFile."niri".source = outOfStore "${dots}/niri";
}
