{tools, ...}: let
  # caelestia-package = pkgs.callPackage ./package.nix { inherit quickshell; };
in {
  imports = [
    (tools.relative "<caelestia-shell>")
  ];

  programs.caelestia = {
    enable = true;
    settings = {
      services = {
        defaultPlayer = "musicfox";
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
