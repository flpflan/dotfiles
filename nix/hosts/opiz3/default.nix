inputs:

let
    tools = import ../../tools inputs;
in 
{
  specialArgs = inputs // {
    inherit tools;
  };
  system = "aarch64-linux";
  modules = [
    ./configuration.nix
  ];
}
