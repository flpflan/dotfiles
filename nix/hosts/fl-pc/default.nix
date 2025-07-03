{
  inputs,
  tools,
  fl-dots,
  ...
}:
let
  inherit (tools) relative;
in 

{
  specialArgs = inputs // { inherit inputs tools fl-dots; };
  system = "x86_64-linux";
  modules = [
    ./system
	  ./secrets.nix
    ./overlays.nix
    (relative "hosts/common/chaotic.nix")
	  (relative "hosts/common/agenix.nix")
	  (relative "hosts/common/facter.nix")
	  (relative "<stylix>")
	  (relative "users/flpflan")
  ];
}
