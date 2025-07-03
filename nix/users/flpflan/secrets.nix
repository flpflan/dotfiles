{ tools, ... }:
let
  inherit (tools) relative;
in
{
  age.secrets."users/flpflan/passwd" = {
    file = relative "secrets/users/flpflan/passwd.age";
  };
}
