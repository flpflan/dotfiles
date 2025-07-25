{
  inputs,
  tools,
  ...
}@args:
let
  inherit (tools) relative;

  fl-dots = "/home/flpflan/.dotfiles";
in 

{
  specialArgs = inputs // args // { inherit fl-dots; };
  system = "x86_64-linux";
  modules = [
    ./system
	  ./secrets.nix
    ./overlays.nix
    (relative "hosts/common/chaotic.nix")
	  (relative "hosts/common/agenix.nix")
	  (relative "hosts/common/facter.nix")
	  # (relative "hosts/common/stylix.nix")
	  (relative "users/flpflan")
  ];
}
