{
  inputs,
  tools,
  ...
}@args:
let
  inherit (tools) relative module;
in 

{
  specialArgs = inputs // args;
  system = "x86_64-linux";
  modules = [
    ./system
    ./server
	  ./secrets.nix
    ./overlays.nix
    (relative "hosts/common/chaotic.nix")
	  (relative "hosts/common/agenix.nix")
	  # (relative "hosts/common/facter.nix")
	  (relative "users/flpflan")
	  (relative "users/apps")
	  # (module "<srvos-server>")
	  (module "<disko>")
  ];
}
