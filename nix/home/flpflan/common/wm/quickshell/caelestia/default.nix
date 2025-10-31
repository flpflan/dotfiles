{
  config,
  tools,
  fl-dots,
  ...
}: let
  # caelestia-package = pkgs.callPackage ./package.nix { inherit quickshell; };
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in {
  imports = [
    (tools.relative "<caelestia-shell>")
  ];

  home.file.".face".source = outOfStore "${fl-dots}/assets/face";
  xdg.configFile."caelestia/shell.json".source = outOfStore "${fl-dots}/caelestia/shell.json";
  xdg.configFile."caelestia/cli.json".source = outOfStore "${fl-dots}/caelestia/cli.json";

  programs.caelestia = {
    enable = true;
    systemd.enable = false;
    settings = {
      # services = {
      #   defaultPlayer = "musicfox";
      # };
      # paths = {
      #   wallpaperDir = "~/Pictures/wallpaper";
      # };
      # general = {
      #   idle = {
      #     timeouts = [
      #       {
      #         "timeout" = 600; # 10 minutes
      #         "idleAction" = "lock";
      #       }
      #       {
      #         "timeout" = 900; # 15 minutes
      #         "idleAction" = "dpms off";
      #         "returnAction" = "dpms on";
      #       }
      #       {
      #         "timeout" = 1200; # 20 minutes
      #         "idleAction" = ["systemctl" "suspend-then-hibernate"];
      #       }
      #     ];
      #   };
      # };
      # launcher = {
      #   maxWallpapers = 9;
      #   enableDangerousActions = true;
      # };
      # background = {
      #   visualiser = {
      #     enabled = true;
      #     blur = true;
      #   };
      # };
    };
    cli = {
      enable = true;
      settings = {
        # toggles = {
        #   music = {
        #     musicfox = {
        #       enable = true;
        #       match = [{class = "musicfox";}];
        #       # command = ["kitty" "--class" "musicfox" "-e" "fish" "--interactive" "-c" "musicfox"];
        #       command = ["foot" "-a" "musicfox" "-T" "musicfox" "fish" "-C" "exec musicfox"];
        #       move = true;
        #     };
        #   };
        # };
      };
    };
  };
}
