{ config, pkgs, fl-dots, ... }:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  home.packages = [ pkgs.starship ];
  # xdg.configFile."starship.toml".source = outOfStore "${fl-dots}/zsh/starship.toml";
  xdg.configFile."starship.toml".source = outOfStore "${dots}/starship.toml";
}
