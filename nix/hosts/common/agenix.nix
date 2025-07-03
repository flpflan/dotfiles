{ tools, ... }:

{
  imports = [
    (tools.module "<agenix-nixos>")
  ];

  age.identityPaths = [
    "/etc/ssh/ssh_host_ed25519_key"
    "/etc/ssh/ssh_host_rsa_key"
    "/tmp/ssh_host_ed25519_key"
    "/tmp/ssh_host_rsa_key"
    "/tmp/id_ed25519"
    "/tmp/id_rsa"
  ];
}
