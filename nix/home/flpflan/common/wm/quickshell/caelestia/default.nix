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

  programs.caelestia = {
    enable = true;
    systemd.enable = false;
    settings = {
      services = {
        defaultPlayer = "musicfox";
      };
      paths = {
        wallpaperDir = "~/Pictures/wallpaper";
      };
    };
    cli = {
      enable = true;
      settings = {
        toggles = {
          music = {
            musicfox = {
              enable = true;
              match = [{class = "musicfox";}];
              command = ["kitty" "--class" "musicfox" "-e" "fish" "--interactive" "-c" "musicfox"];
              move = true;
            };
          };
        };
      };
    };
  };
}
