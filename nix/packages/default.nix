pkgs: {
  qt6ct-kde = pkgs.callPackage ./qt6ct-kde/package.nix { };
  misans = pkgs.callPackage ./misans/package.nix { };
  huion-hc16-driver = pkgs.callPackage ./huion-hc16-driver/package.nix {};
}
