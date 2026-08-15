{
  pkgs,
  config,
  fl-dots,
  ...
}:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = [ pkgs.labwc pkgs.xwayland ];

  xdg.configFile."labwc".source = outOfStore "${dots}/labwc";
}
