{ pkgs, ... }:

{
  # boot.kernelPackages = pkgs.linuxPackages_cachyos-lto;
  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  boot.initrd.includeDefaultModules = false;
  boot.initrd.availableKernelModules = [
    "nvme" "xhci_pci" "usb_storage" "usbhid" "ext4" "btrfs" "dm_mod"
  ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [
    "tcp_bbr" 
  ];
  boot.extraModulePackages = [ ];
  boot.blacklistedKernelModules = [
    "sp5100_tco" "wdat_wdt" # Block watchdog
    "ahci" "sata_nv" "sata_via" "sata_sis" "sata_uli" "sata_ata_piix" "pata_marvell" # Some SATA/PATA stuffs
    "kvm-amd"
    "thunderbolt"
    "sdhci_pci" # For SD card reader
    "sd_mod" "sr_mod" # For SATA SSD/HDD, CD-ROM
    # "pcips2" "atkbd" "i8042" "rtc_cmos" # x86 stuff
  ];
  boot.kernel.sysctl = {
    "kernel.nmi_watchdog" = "0";
    # Enable bbr
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.core.default_qdisc" = "fq";
    # For clash use
    "net.ipv4.ip_forward" = "1";
  };
  boot.kernelParams = [
    # "amd_pstate=active"
    "mitigations=off" "nowatchdog" "nmi_watchdog=0" "resume=UUID=7faaccfe-1ef9-40d3-9238-c63565854bd3" "quiet"
    # For theming tty
    "vt.default_red=30,243,166,249,137,245,148,186,88,243,166,249,137,245,148,166"
    "vt.default_grn=30,139,227,226,180,194,226,194,91,139,227,226,180,194,226,173"
    "vt.default_blu=46,168,161,175,250,231,213,222,112,168,161,175,250,231,213,200"
  ];

}
