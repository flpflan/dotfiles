{ nixpkgs, ... }:
let
  inherit (builtins) map attrNames readDir;
  inherit (nixpkgs.lib.attrsets) filterAttrs;
  inherit (nixpkgs.lib.strings) hasSuffix;

  interested = path: _type:
    (_type == "directory") # Include directories
    || (hasSuffix ".nix" path) # Include .nix filterAttrs
    && (path != "default.nix"); # Ignore default.nix
in
path:
map (f: (path + "/${f}")) (
  attrNames (
    filterAttrs interested (readDir path)
  )
)
