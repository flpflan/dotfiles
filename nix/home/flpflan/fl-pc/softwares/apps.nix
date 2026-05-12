{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # godot
    # aseprite
    (krita.override { binaryPlugins = [ ]; })
    telegram-desktop
    # drawy
    # xournalpp
    # kazumi
  ];
}
