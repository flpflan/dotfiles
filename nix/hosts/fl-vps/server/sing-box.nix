{ config, ... }:

let
  inherit (config.age) secrets;
in 
{
  networking.firewall.allowedTCPPorts = [ 63897 2082 25540 41983 ];

  services.sing-box = {
    enable = true;
    settings = {
      _secret = secrets."hosts/fl-vps/sb.json".path;
    };
  };
}
