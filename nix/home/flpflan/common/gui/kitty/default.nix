{
  config,
  pkgs,
  fl-dots,
  ...
}: let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;

  wrapedConfig = pkgs.writeText "kitty.conf" (builtins.concatStringsSep "\n" [
    "include ${outOfStore "${fl-dots}/kitty/kitty.conf"}"
    (
      pkgs.lib.optionalString
      (config.programs.kitty.settings != {})
      "include ${config.xdg.configHome}/kitty/kitty.conf"
    )
  ]);

  kitty = pkgs.writeShellScriptBin "kitty" ''
    exec ${pkgs.kitty}/bin/kitty --config ${wrapedConfig} "$@"
  '';
in {
  programs.kitty = {
    enable = true;
    package = kitty;
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = config.programs.fish.enable;
    shellIntegration.enableZshIntegration = config.programs.zsh.enable;
    shellIntegration.enableBashIntegration = config.programs.bash.enable;
  };
}
