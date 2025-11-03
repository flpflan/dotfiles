{
  pkgs,
  tools,
  ...
}: {
  imports = map tools.relative [
    "home/flpflan/common/desktop/wm/hyprland"
    "home/flpflan/common/desktop/rice/caelestia"
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
