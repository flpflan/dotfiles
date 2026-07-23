{
  description = "flpflan's NixOS flake";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://attic.xuyh0120.win/lantian"
      "https://noctalia.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }:
  let
    eachSystem = nixpkgs.lib.genAttrs nixpkgs.lib.platforms.linux;
    pkgsFor = eachSystem (system: nixpkgs.legacyPackages.${system}.appendOverlays [
      self.overlays.default
    ]);
  in
  {
    #
    # Overlays
    #
    overlays = import ./overlays inputs;
    #
    # Packages
    #
    packages = eachSystem (system: import ./packages pkgsFor.${system});
  }
  // {
    #
    # NixOS Configurations
    #
    nixosConfigurations = {
      fl-pc = nixpkgs.lib.nixosSystem (import ./hosts/fl-pc inputs);
      opiz3 = nixpkgs.lib.nixosSystem (import ./hosts/opiz3 inputs);
      fl-vps = nixpkgs.lib.nixosSystem (import ./hosts/fl-vps inputs);
    };
    #
    # OS Images
    #
    packages.x86_64-linux = {
      fl-vps-image = self.nixosConfigurations.fl-vps.config.system.build.diskoImages;
      opiz3-image = self.nixosConfigurations.opiz3.config.system.build.sdImage;
    };
    #
    # Home Manager Standalone Configrations
    #
    homeConfigurations = {
      "flpflan@fl-pc" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsFor.x86_64-linux;
        modules = [ ./home/flpflan/fl-pc ];
        extraSpecialArgs = inputs // {
          tools = import ./tools inputs;
        } // {
          fl-dots = "/home/flpflan/.dotfiles";
        };
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #
    # fl-pc
    #
    nix-cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel/release";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # zen-browser = {
    #   url = "github:0xc000022070/zen-browser-flake";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.home-manager.follows = "home-manager";
    # };
    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        darwin.follows = "";
        home-manager.follows = "home-manager";
      };
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
    # caelestia-shell = {
    #   url = "github:caelestia-dots/shell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvim = {
      url = "path:../../../nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    huion-driver = {
      url = "github:flpflan/nix-huion-driver";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #
    # fl-vps
    #
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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

    #
    # opiz3
    #
    opiz3-nix = {
      url = "github:flpflan/orangepizero3-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
