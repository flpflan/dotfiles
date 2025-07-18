{ tools, lib, ... }:
{
  imports = map tools.relative [
    # "home/flpflan/common/headless"
    "home/flpflan/common/agenix.nix"
  ];
  nix.gc = {
    automatic = true;
    frequency = "weekly";
    options = "--delete-older-than 7d";
  };

  programs.home-manager.enable = true;

  home.username = "flpflan";
  home.homeDirectory = "/home/flpflan";

  programs.git = {
    enable = true;
    userName = "flpflan";
    userEmail = "flpflan@gmail.com";
  };

  home.activation = {
    rmSomeThing = lib.hm.dag.entryAfter ["writeBoundary"] ''
    rm -rf $HOME/.nix-defexpr
    rm -rf $HOME/.nix-profile
  '';
  };
  home.stateVersion = "25.11";
}
