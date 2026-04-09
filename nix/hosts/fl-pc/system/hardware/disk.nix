{ pkgs, ... }:

{
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" ];
  };

  systemd.services.duperemove-home = {
    path = [ pkgs.duperemove ];
    script = "duperemove -r -d /home";
    serviceConfig.Type = "oneshot";
  };
  systemd.timers.duperemove-home = {
    wantedBy = [ "timers.target" ];
    timerConfig.OnCalendar = "monthly";
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/3415dcb1-482f-4fea-b6aa-92b9b0c63ab0";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd:3" "discard=async" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/3415dcb1-482f-4fea-b6aa-92b9b0c63ab0";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd:3" "discard=async" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/3415dcb1-482f-4fea-b6aa-92b9b0c63ab0";
      fsType = "btrfs";
      options = [ "subvol=nix" "noatime" "compress=zstd:3" "discard=async" ];
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
