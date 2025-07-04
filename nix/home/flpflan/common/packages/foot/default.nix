{ config, pkgs, fl-dots, ... }:

let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;

  wrapedConfig = pkgs.writeText "foot.ini" ''
    include = ${outOfStore "${fl-dots}/foot/foot.ini"}
    include = ${config.xdg.configHome}/foot/foot.ini
  '';

  foot = pkgs.writeShellScriptBin "foot" ''
    exec ${pkgs.foot}/bin/foot --config ${wrapedConfig} "$@"
  '';
in 
{
  programs.foot = {
    enable = true;
    package = foot;
  };
}
