{ tools, ... }:

{
  imports = tools.scan ./.;

  #TODO:
  zramSwap.enable = true;
}
