{
  inputs,
  outputs,
  tools,
  ...
}:

{
  specialArgs = inputs // {
    inherit tools outputs;
  };
  system = "aarch64-linux";
  modules = [
    ./configuration.nix
  ];
}
