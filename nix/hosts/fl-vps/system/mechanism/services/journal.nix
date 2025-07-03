{
  services.journald.extraConfig = ''
    Compress=yes
    SystemMaxUse=1G
    SystemMaxFileSize=200M
    MaxRetentionSec=14day
  '';
}
