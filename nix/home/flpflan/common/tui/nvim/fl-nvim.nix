{
  config,
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
        };
        categories = {
          core = true;
          language = {
            nix = true;
            lua = true;
            cpp = true;
            toml = true;
            yaml = true;
            json = true;
            python = true;
            hyprlang = true;
            markdown = true;
          };
          ai = true;
          request = false;
        };
      };
    };
  };

  xdg.configFile."nvim" = {
    source = outOfStore "${fl-dots}/nvim/fl-nvim";
    recursive = false;
  };
}
