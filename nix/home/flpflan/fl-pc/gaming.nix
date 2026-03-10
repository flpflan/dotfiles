{ pkgs, tools, ... }:

{
  imports = [
    (tools.relative "home/flpflan/common/apps/prism-launcher")
  ];
  # programs.steam = {
  #   enable = true;
  #   gamescopeSession = true;
  # };
  #
  # # FIXME:
  # programs.gamemode.enable = true;

  home.packages = with pkgs; [
    # bottles
  ];
}
