{
  inputs,
  tools,
  ...
}:

{
  specialArgs = inputs // { inherit tools; };
  system = "aarch64-linux";
  modules = [
    ./configuration.nix
  ];
}
