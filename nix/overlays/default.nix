# Global Overlays
{ nixpkgs, ... }@inputs:

let
  inherit (nixpkgs) lib;
  source = overlay: import overlay inputs;
  mkOverlays =
    attrs:
    let
      merged =
        final: prev: lib.foldl' lib.recursiveUpdate { } (map (f: f final prev) (lib.attrValues attrs));
    in
    attrs // { default = merged; };

in
mkOverlays {
  agenix = source ./agenix.nix;
  cachyos-kernel = source ./cachyos-kernel.nix;
  nur = source ./nur.nix;
  packages = source ./packages.nix;
}
