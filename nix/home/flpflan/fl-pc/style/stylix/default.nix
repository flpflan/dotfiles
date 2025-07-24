{ tools, ... }:

{
  imports = tools.scan ./.;

  stylix.enable = true;
  stylix.image = ./background.png;
}
