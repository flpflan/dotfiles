{ config, lib, pkgs, fl-dots, ... }:

let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
  extraBins = with pkgs; [ nixd deadnix statix ];
  extraMakeWrapperArgs = "--suffix PATH : ${lib.makeBinPath extraBins}";
  neovim = pkgs.neovim.override { inherit extraMakeWrapperArgs; };
in
{
  home.packages = [ neovim ];
  # programs.neovim = {
  #   # enable = true;
  #   defaultEditor = true;
  #   extraPackages = with pkgs; [
  #     nixd deadnix statix 
  #   ];
  # };
  xdg.configFile."nvim" = {
    source = outOfStore "${fl-dots}/nvim/legacy";
    recursive = true;
  };
}
