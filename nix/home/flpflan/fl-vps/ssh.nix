{ config, ... }:

let
  inherit (config.age) secrets;
in 
{
  users.users.flpflan.openssh.authorizedKeys.keys = [
    secrets."users/flpflan/id_ed25519.pub".path
  ];
}
