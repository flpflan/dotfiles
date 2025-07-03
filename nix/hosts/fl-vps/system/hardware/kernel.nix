{ pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.includeDefaultModules = false;
  boot.initrd.availableKernelModules = [ "ext4" "xfs" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "tcp_bbr" ];
  boot.extraModulePackages = [ ];
  boot.blacklistedKernelModules = [
    "ahci" "sata_nv" "sata_via" "sata_sis" "sata_uli" "sata_ata_piix" "pata_marvell" # Some SATA/PATA stuffs
    "thunderbolt"
    "sdhci_pci" # For SD card reader
    # "pcips2" "atkbd" "i8042" "rtc_cmos" # x86 stuff
  ];
  boot.kernel.sysctl = {
    # Enable bbr
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.core.default_qdisc" = "fq";
  };
  boot.kernelParams = [ "quiet" ];
}
