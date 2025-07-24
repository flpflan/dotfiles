{ pkgs, ... }:

{
  home.packages = with pkgs; [
    qt6ct qt5ct
  ];
}
