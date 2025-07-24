{ pkgs, ... }:

{
  home.packages = with pkgs; [
    qt6ct
  ];
}
