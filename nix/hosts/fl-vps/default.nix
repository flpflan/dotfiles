inputs@{
  srvos,
  disko,
  ...
}:

let
  tools = import ../../tools inputs;
  inherit (tools) relative;
in
{
  specialArgs = inputs // {
    inherit tools;
  };
  system = "x86_64-linux";
  modules = [
    ./system
    ./server
    ./secrets.nix
    ./overlays.nix
    # (relative "hosts/common/chaotic.nix")
    (relative "hosts/common/agenix.nix")
    # (relative "hosts/common/facter.nix")
    (relative "hosts/common/keys.nix")
    (relative "users/flpflan")
    (relative "users/apps")
    srvos.nixosModules.server
    disko.nixosModules.disko
  ];
}
