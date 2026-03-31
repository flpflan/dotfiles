pkgs: {
  qt6ct-kde = pkgs.callPackage ./qt6ct-kde/package.nix { };
  misans = pkgs.callPackage ./misans/package.nix { };
  lxgw-neoxihei-screen-full = pkgs.callPackage ./lxgw-neoxihei-screen-full/package.nix { };
}
