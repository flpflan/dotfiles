{
  pkgs,
  tools,
  ...
}: {
  imports = map tools.relative [
    # "home/flpflan/common/desktop/wm/hyprland"
    # "home/flpflan/common/desktop/rice/caelestia"
    "home/flpflan/common/desktop/wm/niri"
    "home/flpflan/common/desktop/rice/noctalia"
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    xdgOpenUsePortal = true;
    config.common.default = "*";
  };

  home.packages = with pkgs; [
    xdg-utils
  ];
}
