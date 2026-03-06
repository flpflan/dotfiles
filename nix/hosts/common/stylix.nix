{ stylix, ... }:

{
  imports = [
    stylix.nixosModules.stylix
  ];
  stylix.enable = true;
}
