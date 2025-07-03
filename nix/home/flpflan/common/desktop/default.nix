{ pkgs, tools, ... }:

let
  inherit (builtins) filter elem;
  exclude = [
    # ./bar
  ];
in 
{
  imports = filter (x: !(elem x exclude)) (tools.scan ./.);

  home.packages = with pkgs; [
    playerctl brightnessctl lazygit
  ];
}
