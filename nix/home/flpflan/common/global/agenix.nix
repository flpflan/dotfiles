{ config, tools, ... }:

let
  inherit (config.home) username homeDirectory;
in 
{
  imports = [
    (tools.module "<agenix-home-manager>")
  ];

  age.identityPaths = [
    "${homeDirectory}/.ssh/id_ed25519"
    "${homeDirectory}/.ssh/id_rsa"
    "/tmp/id_ed25519_${username}"
    "/tmp/id_rsa_${username}"
    "/etc/ssh/ssh_host_ed25519_key"
    "/etc/ssh/ssh_host_rsa_key"
    "/tmp/ssh_host_ed25519_key"
    "/tmp/ssh_host_rsa_key"
    "/tmp/id_ed25519"
    "/tmp/id_rsa"
  ];
}
