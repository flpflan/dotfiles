{
  description = "flpflan's neovim configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
    # neovim-nightly-overlay = {
    #   url = "github:nix-community/neovim-nightly-overlay";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    "plugins-nvim-better-n" = {
      url = "github:jonatan-branting/nvim-better-n";
      flake = false;
    };
    "plugins-smart-paste" = {
      url = "github:nemanjamalesija/smart-paste.nvim";
      flake = false;
    };
    "plugins-smart-motion" = {
      url = "github:FluxxField/smart-motion.nvim";
      flake = false;
    };
    "plugins-keytrail" = {
      url = "github:JFryy/keytrail.nvim";
      flake = false;
    };
    "plugins-neotab" = {
      url = "github:kawre/neotab.nvim";
      flake = false;
    };
    "plugins-garbage-day" = {
      url = "github:zeioth/garbage-day.nvim";
      flake = false;
    };
    # "plugins-nvim-dap-repl-highlights" = {
    #   url = "github:LiadOz/nvim-dap-repl-highlights";
    #   flake = false;
    # };
    "plugins-nvim-toggler" = {
      url = "github:nguyenvukhang/nvim-toggler";
      flake = false;
    };
    # "plugins-sweetie" = {
    #   url = "github:NTBBloodbath/sweetie.nvim";
    #   flake = false;
    # };
    # "plugins-daylight" = {
    #   url = "github:NTBBloodbath/daylight.nvim";
    #   flake = false;
    # };
    "plugins-ts-error-translator" = {
      url = "github:dmmulroy/ts-error-translator.nvim";
      flake = false;
    };
    "plugins-oil-vcs-status" = {
      url = "github:SirZenith/oil-vcs-status";
      flake = false;
    };
    "plugins-exrc" = {
      url = "github:jedrzejboczar/exrc.nvim";
      flake = false;
    };
    # "plugins-esqueleto" = {
    #   url = "github:cvigilv/esqueleto.nvim";
    #   flake = false;
    # };
    # "plugins-ex-colors" = {
    #   url = "github:aileot/ex-colors.nvim";
    #   flake = false;
    # };
    # "plugins-profile" = {
    #   url = "github:stevearc/profile.nvim";
    #   flake = false;
    # };
    # "plugins-easycolor" = {
    #   url = "github:vi013t/easycolor.nvim";
    #   flake = false;
    # };
    # "plugins-render-markdown" = {
    #   url = "github:MeanderingProgrammer/render-markdown.nvim";
    #   flake = false;
    # };
    "plugins-cmp-dbee" = {
      url = "github:MattiasMTS/cmp-dbee";
      flake = false;
    };
    # "plugins-dir-telescope" = {
    #   url = "github:princejoogie/dir-telescope.nvim";
    #   flake = false;
    # };
    # "plugins-search-replace" = {
    #   url = "github:roobert/search-replace.nvim";
    #   flake = false;
    # };
    # "plugins-gotmpl" = {
    #   url = "github:ngynkvn/gotmpl.nvim";
    #   flake = false;
    # };
    "plugins-yaml" = {
      url = "github:cuducos/yaml.nvim";
      flake = false;
    };
  };
  outputs = {
    nixpkgs,
    nixCats,
    ...
  } @ inputs: let
    inherit (nixCats) utils;
    luaPath = "${./.}";
    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forEachSystem = utils.eachSystem supportedSystems;
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    extra_pkg_config = {
      allowUnfree = true;
    };
    dependencyOverlays =
      [
        (utils.standardPluginOverlay inputs)
      ]
      ++ import ./nix/overlays;
    categoryDefinitions = {
      pkgs,
      settings,
      categories,
      name,
      ...
    } @ packageDef: let
      cats = import ./nix/categories.nix {
        inherit pkgs inputs;
        lib = pkgs.lib;
      };
      attrOrEmpty = attr:
        if builtins.hasAttr attr cats
        then cats."${attr}"
        else {};
    in {
      lspsAndRuntimeDeps = attrOrEmpty "lspsAndRuntimeDeps";
      startupPlugins = attrOrEmpty "startupPlugins";
      optionalPlugins = attrOrEmpty "optionalPlugins";
    };
    base_settings = {pkgs, ...} @ misc: {
      wrapRc = true;
    };
    base_categories = {pkgs, ...} @ misc: {
      core = true;
      language = {
        lua = true;
        nix = true;
      };
      ai = true;
      requests = true;
    };
    base_extra = {pkgs, ...} @ misc: {
      nixdExtras.nixpkgs = ''import ${pkgs.path} {}'';
      nixdExtras.nixos_options = ''(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.fl-pc.options'';
      nixdExtras.home_manager_options = ''(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.fl-pc.options.home-manager.users.type.getSubOptions []'';
    };

    packageDefinitions = {
      nvim = {pkgs, ...} @ misc: {
        settings =
          base_settings misc
          // {
          };
        categories =
          base_categories misc
          // {
          };
        extra = base_extra misc // {};
      };
      nvim_dev = {pkgs, ...} @ misc: {
        settings =
          base_settings misc
          // {
          };
        categories =
          base_categories misc
          // {
            language = true;
            remote = true;
            devtools = true;
            tmux = true;
          };
        extra = base_extra misc // {};
      };
      nvim_minimal = {pkgs, ...} @ misc: {
        settings =
          base_settings misc
          // {
          };
        categories = {
          core = true;
        };
        extra = base_extra misc // {};
      };
    };
    defaultPackageName = "nvim";
  in
    forEachSystem (system: let
      nixCatsBuilder =
        utils.baseBuilder luaPath {
          inherit nixpkgs system dependencyOverlays extra_pkg_config;
        }
        categoryDefinitions
        packageDefinitions;
      defaultPackage = nixCatsBuilder defaultPackageName;
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      packages = utils.mkAllWithDefault defaultPackage;

      # choose your package for devShell
      # and add whatever else you want in it.
      devShells = {
        default = pkgs.mkShell {
          name = "nvim_dev";
          packages = [(nixCatsBuilder "nvim_dev")];
          inputsFrom = [];
          shellHook = ''
          '';
        };
      };
    })
    // (let
      # we also export a nixos module to allow reconfiguration from configuration.nix
      nixosModule = utils.mkNixosModules {
        moduleNamespace = [defaultPackageName];
        inherit
          defaultPackageName
          dependencyOverlays
          luaPath
          categoryDefinitions
          packageDefinitions
          extra_pkg_config
          nixpkgs
          ;
      };
      # and the same for home manager
      homeModule = utils.mkHomeModules {
        moduleNamespace = [defaultPackageName];
        inherit
          defaultPackageName
          dependencyOverlays
          luaPath
          categoryDefinitions
          packageDefinitions
          extra_pkg_config
          nixpkgs
          ;
      };
    in {
      # these outputs will be NOT wrapped with ${system}

      # this will make an overlay out of each of the packageDefinitions defined above
      # and set the default overlay to the one named here.
      overlays =
        utils.makeOverlays luaPath {
          inherit nixpkgs dependencyOverlays extra_pkg_config;
        }
        categoryDefinitions
        packageDefinitions
        defaultPackageName;

      nixosModules.default = nixosModule;
      homeModules.default = homeModule;
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

      inherit utils nixosModule homeModule;
      inherit (utils) templates;
    });
}
