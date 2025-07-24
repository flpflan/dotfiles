{ pkgs, tools, ... }:

{
  imports = tools.scan ./.;

  home.packages = with pkgs; [
    playerctl brightnessctl app2unit
  ];
}
