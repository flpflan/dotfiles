{ config, lib, ... }:
let
  inherit (config.home) username homeDirectory;
  inherit (config.age) secrets;
in
{
  home.activation.secretKeys = lib.hm.dag.entryAfter [ "agenix" ] ''
    run mkdir -p ${homeDirectory}/.ssh
    run install -m 0600 ${secrets."users/${username}/id_ed25519".path} ${homeDirectory}/.ssh/id_ed25519
    run install -m 0644 ${secrets."users/${username}/id_ed25519.pub".path} ${homeDirectory}/.ssh/id_ed25519.pub
    run install -m 0600 <(cat $HOME/.ssh/id_ed25519.pub) $HOME/.ssh/authorized_keys
  '';
}
