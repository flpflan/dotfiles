{
  config,
  tools,
  fl-dots,
  ...
}: let
  # caelestia-package = pkgs.callPackage ./package.nix { inherit quickshell; };
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in {
  imports = [
    (tools.relative "<caelestia-shell>")
  ];

  programs.caelestia = {
    enable = true;
    systemd.enable = false;
    cli.enable = true;
  };

  home.file.".face".source = outOfStore "${fl-dots}/assets/face";
  xdg.configFile."caelestia/shell.json".source = outOfStore "${fl-dots}/caelestia/shell.json";
  xdg.configFile."caelestia/cli.json".source = outOfStore "${fl-dots}/caelestia/cli.json";

}
