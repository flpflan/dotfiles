# Global Overlays
inputs:

let
  source = overlay: import overlay inputs;
in
{
  agenix = source ./agenix.nix;
  cachyos-kernel = source ./cachyos-kernel.nix;
  nur = source ./nur.nix;
  packages = source ./packages.nix;
  qt6-kde = source ./qt6ct-kde.nix;
}
