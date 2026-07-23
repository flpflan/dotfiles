inputs:

let
  overlays = import ../../overlays inputs;
  tools = import ../../tools inputs;
  inherit (tools) relative scan;
  fl-dots = "/home/flpflan/.dotfiles";
in
{
  specialArgs = inputs // {
    inherit overlays tools fl-dots;
  };
  system = "x86_64-linux";
  modules = (scan ./.) ++ [
    # (relative "hosts/common/chaotic.nix")
    (relative "hosts/common/agenix.nix")
    (relative "hosts/common/facter.nix")
    # (relative "hosts/common/stylix.nix")
    (relative "hosts/common/keys.nix")
    (relative "users/flpflan")
  ];
}
