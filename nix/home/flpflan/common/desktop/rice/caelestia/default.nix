{
  config,
  tools,
  fl-dots,
  ...
}: let
  assets = "${fl-dots}/assets";
  dots = "${fl-dots}/dots";
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

  home.file.".face".source = outOfStore "${assets}/face";
  xdg.configFile."caelestia/shell.json".source = outOfStore "${dots}/caelestia/shell.jsonc";
  xdg.configFile."caelestia/cli.json".source = outOfStore "${dots}/caelestia/cli.jsonc";

}
