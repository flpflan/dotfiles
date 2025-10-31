# Global Overlays
{tools, ...} @ inputs: let
  source = overlay: import overlay inputs;
  overlays = tools.scan ./.;
in
  map source overlays
