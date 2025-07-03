{
  services.journald.extraConfig = ''
    SystemMaxUse=500M
    SystemMaxFileSize=100M
    MaxRetentionSec=7day
  '';

  # services.logrotate.enable = true;
}
