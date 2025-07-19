{ config, pkgs, fl-dots, ... }:

let
  isEmpty = attrs: builtins.length (builtins.attrNames attrs) == 0;
  outOfStore = config.lib.file.mkOutOfStoreSymlink;

  wrapedConfig = pkgs.writeText "foot.ini" (builtins.concatStringsSep "\n" [
    "include = ${outOfStore "${fl-dots}/foot/foot.ini"}"
    (pkgs.lib.optionalString
      (isEmpty config.programs.foot.settings)
      # "include = ${config.xdg.configHome}/foot/foot.ini"
    )
  ]);

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
