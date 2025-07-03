{ hyprpanel, nur, ... }:

{
  nixpkgs.overlays = [
    hyprpanel.overlay
    nur.overlays.default
  ]; 
}
