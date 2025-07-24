{ pkgs, ... }:

{
  home.packages = with pkgs; [
    playerctl brightnessctl app2unit trash-cli
  ];
}
