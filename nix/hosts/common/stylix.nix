{ tools, ... }:

{
  imports = [
    (tools.module "<stylix-nixos>")
  ];
  stylix.enable = true;
}
