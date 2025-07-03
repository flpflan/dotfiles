{ tools, ... }:

{
  imports = [
    (tools.module "<nixos-facter-modules>")
  ];
}
