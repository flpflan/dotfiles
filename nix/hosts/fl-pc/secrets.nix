{ tools, ... }:
let
  inherit (tools) relative;
in 
{
  age.secrets."hosts/fl-pc/mihomo.yaml" = {
    file = relative "secrets/hosts/fl-pc/mihomo.yaml.age";
    mode = "0644";
  };
}
