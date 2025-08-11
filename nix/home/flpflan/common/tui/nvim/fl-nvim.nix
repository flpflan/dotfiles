{ pkgs, nvim, ... }:

{
  home.packages = [
    nvim.packages."${pkgs.system}".default
  ];
}
