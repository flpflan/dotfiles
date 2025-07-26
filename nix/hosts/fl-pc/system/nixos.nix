{ outputs, lib, nixpkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.substituters = [ "https://cache.nixos.org" ];
  nix.settings.trusted-users = [ "@wheel" ];
  # nix.settings.warn-dirty = false;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = outputs.overlays;

  nix.registry.nixpkgs.flake = nixpkgs;
  nix.channel.enable = false;
  environment.etc."nix/inputs/nixpkgs".source = "${nixpkgs}";
  nix.settings.nix-path = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs";

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };
  nix.settings.auto-optimise-store = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
