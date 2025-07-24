{ pkgs, tools, ... }:

{
  imports = map tools.relative [
    "home/flpflan/common/wm/hyprland"
    "home/flpflan/common/wm/quickshell/caelestia"
  ];

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}

