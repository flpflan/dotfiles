{
  systemd.network.enable = true;
  services.resolved.enable = true;

  systemd.network.networks.eth0 = {
    address = [ "23.224.194.159/24" ];
    gateway = [ "23.224.194.1" ];
    matchConfig.Name = "eth0";
  };

  networking.nameservers = [
    "8.8.8.8"
    "114.114.114.114"
  ];

  networking = {
    hostName = "fl-vps";
    useDHCP = false;
    usePredictableInterfaceNames = false;
    # interfaces.eth0.useDHCP = true;
  };
}
