{ config, lib, ... }:
let
  inherit (config.age) secrets;
in 
{
  networking.firewall.enable = false;
  # programs.clash-verge = {
  #   enable = true;
  #   package = pkgs.clash-nyanpasu;
  #   autoStart = true;
  #   serviceMode = true;
  #   tunMode = true;
  # };
  # programs.nekoray = {
  #   enable = true;
  # };
  # services.dae = {
  #   enable = true;
  # };
  services.mihomo = {
    enable = true;
    tunMode = true;
    configFile = secrets."hosts/fl-pc/mihomo.yaml".path;
  };
  # Disable the service by default
  systemd.services."mihomo".wantedBy = lib.mkForce [ ];
}
