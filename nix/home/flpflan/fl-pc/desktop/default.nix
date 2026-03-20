{ pkgs, tools, ... }:

{
  imports = tools.scan ./.;

  xdg = {
    enable = true;
    userDirs.enable = true;

    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      xdgOpenUsePortal = true;
      config.common.default = "*";
    };
  };

  home.packages = with pkgs; [
    xdg-utils
  ];
}
