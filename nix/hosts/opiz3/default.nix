{
  inputs,
  tools,
  flake,
  ...
}: {
  specialArgs = inputs // {inherit tools flake;};
  system = "aarch64-linux";
  modules = [
    ./configuration.nix
  ];
}
