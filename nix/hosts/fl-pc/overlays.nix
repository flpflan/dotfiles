# Host Specific Overlays
{ overlays, ... }:

{
  nixpkgs.overlays = [ overlays.default ];
}
