{
  config,
  fl-dots,
  ...
}: let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in {
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = config.programs.fish.enable;
    shellIntegration.enableZshIntegration= config.programs.zsh.enable;
    shellIntegration.enableBashIntegration= config.programs.bash.enable;
  };

  xdg.configFile."kitty" = {
    source = outOfStore "${fl-dots}/kitty";
    recursive = false;
  };
}
