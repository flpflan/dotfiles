{ tools, lib, ... }:
{
  imports = map tools.relative [
    "<stylix-home-manager>"
    "home/flpflan/common/agenix.nix"
  ]
  ++ tools.scan ./.;

  nix.gc = {
    automatic = true;
    frequency = "weekly";
    options = "--delete-older-than 7d";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";

  home.username = "flpflan";
  home.homeDirectory = "/home/flpflan";

  programs.git = {
    enable = true;
    userName = "flpflan";
    userEmail = "flpflan@gmail.com";
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  home.activation = {
    rmSomeThing = lib.hm.dag.entryAfter ["writeBoundary"] ''
    rm -rf $HOME/.nix-defexpr
    rm -rf $HOME/.nix-profile
  '';
  };
}
