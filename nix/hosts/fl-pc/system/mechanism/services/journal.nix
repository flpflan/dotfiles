{
  services.journald = {
    # storage = "volatile"; # stored in memory
    extraConfig = ''
      SystemMaxUse=500M
      SystemMaxFileSize=100M
      MaxRetentionSec=7day
    '';
  };

  # services.logrotate.enable = true;
}
