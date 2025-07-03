{
  disko.devices.disk.main = {
    type = "disk";
    device = "/dev/vda";
    content = {
      # type = "gpt";
      # partitions = {
      #   boot = {
      #     size = "200M";
      #     type = "EF00";
      #     content = {
      #       type = "filesystem";
      #       format = "xfs";
      #       mountpoint = "/boot";
      #       mountOptions = [ "defaults" ];
      #     };
      #   };
      #   primary = {
      #     size = "100%";
      #     content = {
      #       type = "lvm_pv";
      #       vg = "pool";
      #     };
      #   };
      # };
      # type = "lvm_pv";
      # vg = "pool";
      type = "filesystem";
      format = "ext4";
      mountpoint = "/";
      mountOptions = [ "defaults" ];
    };
  };

  disko.devices.disk.attached = {
    type = "disk";
    device = "/dev/vdb";
    content = {
      # type = "lvm_pv";
      # vg = "pool";
      type = "filesystem";
      format = "ext4";
      mountpoint = "/www";
      mountOptions = [ "defaults" ];
    };
  };

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
}
