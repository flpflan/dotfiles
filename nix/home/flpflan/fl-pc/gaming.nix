{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    gamescopeSession = true;
  };

  # FIXME:
  programs.gamemode.enable = true;

  home.packages = with pkgs; [
    bottles
  ];
}
