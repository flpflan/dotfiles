{ noctalia-greeter, ... }:

{
  imports = [
    noctalia-greeter.nixosModules.default
  ];

  programs.noctalia-greeter = {
    enable = true;
  };
}
