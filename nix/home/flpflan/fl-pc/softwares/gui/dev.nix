{ pkgs, ... }:

{
  home.packages = with pkgs; [
    reqable
  ];
}
