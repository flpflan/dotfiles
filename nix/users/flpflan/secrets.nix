{ tools, ... }:
let
  inherit (tools) relative;
in
{
  age.secrets."users/flpflan/passwd" = {
    file = relative "secrets/users/flpflan/passwd.age";
  };
  age.secrets."users/flpflan/id_ed25519" = {
    file = relative "secrets/users/flpflan/id_ed25519.age";
  };
  age.secrets."users/flpflan/id_ed25519.pub" = {
    file = relative "secrets/users/flpflan/id_ed25519.pub.age";
  };
  age.secrets."users/flpflan/id_rsa" = {
    file = relative "secrets/users/flpflan/id_rsa.age";
  };
  age.secrets."users/flpflan/id_rsa.pub" = {
    file = relative "secrets/users/flpflan/id_rsa.pub.age";
  };
}
