{ pkgs, ... }:

{
  home.packages = with pkgs; [
    qt6ct libsForQt5.qt5ct
  ];
}
