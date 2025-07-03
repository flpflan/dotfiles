{
  facter.detected.dhcp.enable = false;

  networking = {
    hostName = "fl-pc";
    # useDHCP = true;
    # interfaces.enp4s0.useDHCP = true;
    # interfaces.wlp5s0.useDHCP = true;
    networkmanager = {
      enable = true;
      # wifi.backend = "iwd";
    };
    # wireless.iwd = {
    #   enable = true;
    #   settings = {
    #     Settings = {
    #       AutoConnect = true;
    #     };
    #   };
    # };
  };
}
