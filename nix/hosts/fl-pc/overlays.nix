# Host Specific Overlays
{ outputs, ... }:

{
  nixpkgs.overlays = [ outputs.overlays.default ];
}
