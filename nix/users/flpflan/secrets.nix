{ tools, ... }:
let
  inherit (tools) relative;
in
{
  age = {
    identityPaths = [
      "/home/flpflan/.ssh/id_ed25519"
      "/home/flpflan/.ssh/id_rsa"
    ];
    secrets = {
      "users/flpflan/passwd" = {
        file = relative "secrets/users/flpflan/passwd.age";
      };
      "users/flpflan/id_ed25519" = {
        file = relative "secrets/users/flpflan/id_ed25519.age";
      };
      "users/flpflan/id_ed25519.pub" = {
        file = relative "secrets/users/flpflan/id_ed25519.pub.age";
      };
      "users/flpflan/id_rsa" = {
        file = relative "secrets/users/flpflan/id_rsa.age";
      };
      "users/flpflan/id_rsa.pub" = {
        file = relative "secrets/users/flpflan/id_rsa.pub.age";
      };
    };
  };
}
