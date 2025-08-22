{tools, ...}: let
  # caelestia-package = pkgs.callPackage ./package.nix { inherit quickshell; };
in {
  imports = [
    (tools.relative "<caelestia-shell>")
  ];

  programs.caelestia = {
    enable = true;
    cli = {
      enable = true;
    };
  };
}
