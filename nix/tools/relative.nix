{ nixpkgs, ... }:

path: nixpkgs.lib.path.append ../. path
