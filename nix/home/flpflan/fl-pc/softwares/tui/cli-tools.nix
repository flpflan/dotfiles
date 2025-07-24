{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lazygit fishMinimal jq
  ];
}
