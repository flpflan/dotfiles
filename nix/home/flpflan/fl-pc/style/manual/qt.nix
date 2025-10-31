{ pkgs, ... }:

{
  home.packages = with pkgs; [
    qt6Packages.qt6ct libsForQt5.qt5ct
  ];
}
