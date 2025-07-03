{
  inputs,
  tools,
  ...
}:
let
  inherit (tools) relative module;
in 

{
  specialArgs = inputs // { inherit inputs tools; };
  system = "x86_64-linux";
  modules = [
    ./system
    ./server
	  ./secrets.nix
    ./overlays.nix
    (relative "hosts/common/chaotic.nix")
	  (relative "hosts/common/agenix.nix")
	  (relative "hosts/common/facter.nix")
	  (relative "users/flpflan")
	  (relative "users/apps")
	  (module "<srvos-server>")
	  (module "<disko>")
  ];
}
