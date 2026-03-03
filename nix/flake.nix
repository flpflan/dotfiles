{
  description = "flpflan's NixOS flake";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://attic.xuyh0120.win/lantian"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
    ];
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    ...
  }: let
    tools = import ./tools (with nixpkgs; {inherit inputs outputs lib tools;});
    # TODO:
    overlays = import ./overlays (with self; with nixpkgs; {inherit inputs outputs lib tools;});
  in let
    makeNixosSystem = {
      hostName,
      system,
      ...
    } @ args: {
      name = hostName;
    };
  in {
    inherit overlays; # Glocal Overlays

    nixosConfigurations = with self; {
      fl-pc = nixpkgs.lib.nixosSystem (import ./hosts/fl-pc {
        inherit inputs outputs lib tools;
        flake = self;
      });
      opiz3 = nixpkgs.lib.nixosSystem (import ./hosts/opiz3 {
        inherit inputs outputs lib tools;
        flake = self;
      });
      fl-vps = nixpkgs.lib.nixosSystem (import ./hosts/fl-vps {
        inherit inputs outputs lib tools;
        flake = self;
      });
    };

    packages.x86_64-linux = {
      fl-vps-image = self.nixosConfigurations.fl-vps.config.system.build.diskoImages;
      opiz3-image = self.nixosConfigurations.opiz3.config.system.build.sdImage;
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    # chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel/release";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    # zen-nebula = {
    #   url = "github:JustAdumbPrsn/Nebula-A-Minimal-Theme-for-Zen-Browser";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # opiz3-nix = {
    #   url = "github:flpflan/orangepizero3-nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
      inputs.home-manager.follows = "home-manager";
    };
    # disko = {
    #   url = "github:nix-community/disko";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    nixos-facter-modules.url = "github:nix-community/nixos-facter-modules";
    # comin = {
    #   url = "github:nlewo/comin";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # srvos = {
    #   url = "github:nix-community/srvos";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # thb-proxy = {
    #   url = "git+ssh@github.com:flpflan/thb-proxy.git";
    #   flake = false;
    # };
    # stylix = {
    #   url = "github:danth/stylix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # illogical-impulse = {
    #   url = "github:xBLACKICEx/end-4-dots-hyprland-nixos";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   # inputs.illogical-impulse-dotfiles.follows = "";
    # };
    # caelestia-shell = {
    #   url = "github:caelestia-dots/shell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # niri-flake = {
    #   url = "github:sodiboo/niri-flake";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    nvim = {
      url = "path:../nvim/fl-nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
