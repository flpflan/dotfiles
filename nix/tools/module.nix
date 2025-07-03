{ inputs, ... }:

name:
if name == "<home-manager>" then
    inputs.home-manager.nixosModules.home-manager
else if name == "<agenix-nixos>" then
    inputs.agenix.nixosModules.default
else if name == "<agenix-home-manager>" then
    inputs.agenix.homeManagerModules.default
else if name == "<chaotic>" then
    inputs.chaotic.nixosModules.default
else if name == "<nixos-facter-modules>" then
    inputs.nixos-facter-modules.nixosModules.facter
else if name == "<disko>" then
    inputs.disko.nixosModules.disko
else if name == "<srvos-server>" then
    inputs.srvos.nixosModules.server
else if name == "<stylix-nixos>" then
    inputs.stylix.nixosModules.stylix
else if name == "<stylix-home-manager>" then
    inputs.stylix.homeManagerModules.stylix
else
    abort
