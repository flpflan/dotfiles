{
  inputs,
  outputs,
  tools,
  ...
}:

let
  inherit (tools) relative scan;
  fl-dots = "/home/flpflan/.dotfiles";
in
{
  specialArgs = inputs // {
    inherit tools fl-dots outputs;
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
