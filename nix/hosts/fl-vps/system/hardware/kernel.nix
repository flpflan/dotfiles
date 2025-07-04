{ lib, config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # boot.initrd.includeDefaultModules = false;
  boot.initrd.availableKernelModules = [
    "virtio_net"
    "virtio_pci"
    "virtio_mmio"
    "virtio_blk"
    "virtio_scsi"
  ];
  boot.initrd.kernelModules = [
    "virtio_balloon"
    "virtio_console"
    "virtio_rng"
  ];
  # 开启 ZSTD 压缩和基于 systemd 的第一阶段启动
  boot.initrd = {
    compressor = "zstd";
    compressorArgs = ["-19" "-T0"];
    systemd.enable = true;
  };
  boot.initrd.postDeviceCommands = lib.mkIf (!config.boot.initrd.systemd.enable) ''
    # Set the system time from the hardware clock to work around a
    # bug in qemu-kvm > 1.5.2 (where the VM clock is initialised
    # to the *boot time* of the host).
    hwclock -s
  '';
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
  boot.kernelParams = [
    # "quiet"
    # 关闭内核的操作审计功能
    "audit=0"
    # 不要根据 PCIe 地址生成网卡名（例如 enp1s0，对 VPS 没用），而是直接根据顺序生成（例如 eth0）
    "net.ifnames=0"
  ];
}
