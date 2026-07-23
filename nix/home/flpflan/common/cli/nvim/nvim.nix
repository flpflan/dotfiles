{
  config,
  pkgs,
  nvim,
  fl-dots,
  ...
}: let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in {
  imports = [
    nvim.homeModules.default
  ];

  nvim = {
    enable = true;
    packageDefinitions.merge = {
      nvim = _: {
        settings = {
          wrapRc = false;
          hosts = {
            python3.enable = false;
            ruby.enable = false;
            node.enable = false;
            perl.enable = false;
          };
        };
        categories = {
          core = true;
          language = {
            bundles = {
              # frontend = true;
            };
            # kdl = true;
            nix = true;
            lua = true;
            cpp = true;
            rust = true;
            toml = true;
            yaml = true;
            json = true;
            python = true;
            # hyprlang = true;
            markdown = true;
            # haskell = true;
          };
          ai = false;
          request = false;
        };
        extra = {
          nixdExtras = rec {
            nixpkgs = ''import ${pkgs.path} {}'';
            nixos_options = ''(builtins.getFlake "${fl-dots}/nix").nixosConfigurations.fl-pc.options'';
            home_manager_options = nixos_options + ''.home-manager.users.type.getSubOptions []'';
          };
        };
      };
    };
  };

  xdg.configFile."nvim" = {
    source = outOfStore "${fl-dots}/nvim";
    recursive = false;
  };
}
