{ ... }:

{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/3415dcb1-482f-4fea-b6aa-92b9b0c63ab0";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd:3" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/3415dcb1-482f-4fea-b6aa-92b9b0c63ab0";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd:3" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/3415dcb1-482f-4fea-b6aa-92b9b0c63ab0";
      fsType = "btrfs";
      options = [ "subvol=nix" "noatime" "compress=zstd:3" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/D035-E436";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/7faaccfe-1ef9-40d3-9238-c63565854bd3"; }
    ];
}
