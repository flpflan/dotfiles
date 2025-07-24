{
  description = "flpflan's NixOS flake";

  # nixConfig = {
  #   substituters = [ "https://nix-community.cachix.org" ];
  #   trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
  # };

  outputs = inputs @ { self, nixpkgs, ... }:
    let
      tools = import ./tools (with nixpkgs; { inherit inputs lib; });
    in 
  {
    nixosConfigurations = {
      fl-pc = nixpkgs.lib.nixosSystem (import ./hosts/fl-pc { inherit inputs tools; });
      opiz3 = nixpkgs.lib.nixosSystem (import ./hosts/opiz3 { inherit inputs tools; });
      fl-vps = nixpkgs.lib.nixosSystem (import ./hosts/fl-vps { inherit inputs tools; });
    };

    packages.x86_64-linux = {
      fl-vps-image = self.nixosConfigurations.fl-vps.config.system.build.diskoImages;
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel = { 
      url ="github:Jas-SinghFSU/HyprPanel"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # zen-nebula = {
    #   url = "github:JustAdumbPrsn/Nebula-A-Minimal-Theme-for-Zen-Browser";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    opiz3 = {
      url = "github:flpflan/orangepizero3-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixCats = {
    #   url = "github:BirdeeHub/nixCats-nvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
      inputs.home-manager.follows = "home-manager";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-facter-modules.url = "github:nix-community/nixos-facter-modules";
    # comin = {
    #   url = "github:nlewo/comin";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    srvos = {
      url = "github:nix-community/srvos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    thb-proxy = {
      url = "git+ssh@github.com:flpflan/thb-proxy.git";
      flake = false;
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    illogical-impulse = {
      url = "github:xBLACKICEx/end-4-dots-hyprland-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.illogical-impulse-dotfiles.follows = "";
    };
    caelestia-cli = {
      url = "github:caelestia-dots/cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
