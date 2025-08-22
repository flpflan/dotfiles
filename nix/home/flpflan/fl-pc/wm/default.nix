{
  pkgs,
  tools,
  ...
}: {
  imports = map tools.relative [
    "home/flpflan/common/wm/hyprland"
    "home/flpflan/common/wm/quickshell/caelestia"
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    xdgOpenUsePortal = true;
  };

  home.packages = with pkgs; [
    xdg-utils
  ];
}
