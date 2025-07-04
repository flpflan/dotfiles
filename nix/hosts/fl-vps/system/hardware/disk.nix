{
  disko.enableConfig = false;

  disko.devices.disk.main = {
    imageSize = "5G";
    type = "disk";
    device = "/dev/vda";
    content = {
      type = "gpt";
      partitions = {
        boot = {
          size = "1M";
          type = "EF02"; # for grub MBR
          priority = 0;
        };
        ESP = {
          name ="ESP";
          size = "512M";
          type = "EF00";
          priority = 1;
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [ "fmask=0077" "dmask=0077" ];
          };
        };
        nix = {
          size = "100%";
          content = {
            type = "filesystem";
            format = "btrfs";
            mountpoint = "/";
            mountOptions = [ "compress-force=zstd" "nosuid" "nodev" ];
          };
        };
      };
    };
  };

  # disko.devices.disk.attached = {
  #   type = "disk";
  #   device = "/dev/vdb";
  #   content = {
  #     # type = "lvm_pv";
  #     # vg = "pool";
  #     type = "filesystem";
  #     format = "ext4";
  #     mountpoint = "/www";
  #     mountOptions = [ "defaults" ];
  #   };
  # };

  # disko.devices.lvm_vg.pool = {
  #   type = "lvm_vg";
  #   lvs = {
  #     root = {
  #       size = "100%FREE";
  #       content = {
  #         type = "filesystem";
  #         format = "xfs";
  #         mountpoint = "/";
  #         mountOptions = [ "defaults" ];
  #       };
  #     };
  #   };
  # };
  fileSystems."/" = {
    device = "/dev/vda3";
    fsType = "btrfs";
    options = [ "compress-force=zstd" "nosuid" "nodev" ]; 
  };
  fileSystems."/boot" = {
    device = "/dev/vda2";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };
}
