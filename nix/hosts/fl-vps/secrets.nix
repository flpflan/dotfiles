{ tools, ... }:
let
  inherit (tools) relative;
in 
{
  age.secrets."hosts/fl-vps/sb.json" = {
    file = relative "secrets/hosts/fl-vps/sb.json.age";
    mode = "0400";
  };
}
