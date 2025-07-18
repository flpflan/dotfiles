{ pkgs, tools, ... }:

{
  imports = tools.scan ./.;

  home.packages = with pkgs; [
    lazygit
  ];
}
