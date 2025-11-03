{
  programs.hyprpanel = {
    enable = true;
    hyprland.enable = true;
    overwrite.enable = true;

    settings = {
      theme.font.size = "1rem";
      bar.launcher.autoDetectIcon = true;
      bar.workspaces.reverse_scroll = true;
    };
  };
}
