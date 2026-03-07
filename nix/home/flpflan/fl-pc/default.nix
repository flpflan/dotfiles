{
  outputs,
  tools,
  lib,
  ...
}:

{
  imports =
    map tools.relative [
      # stylix.homeModules.stylix
      "home/flpflan/common/global/agenix.nix"
      # "home/flpflan/common/global/chaotic.nix"
    ]
    ++ tools.scan ./.;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
    persistent = true;
  };
  nixpkgs.overlays = outputs.overlays.default;
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";

  home.username = "flpflan";
  home.homeDirectory = "/home/flpflan";

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "flpflan";
        email = "flpflan@gmail.com";
      };
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    # enableFishIntegration = true;
    nix-direnv.enable = true;
  };

  programs.man.generateCaches = false; # Speed up building

  home.activation = {
    rmSomeThing = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      rm -rf $HOME/.nix-defexpr
      rm -rf $HOME/.nix-profile
    '';
  };
}
