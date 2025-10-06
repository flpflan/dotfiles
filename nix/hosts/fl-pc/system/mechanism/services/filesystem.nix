{
  services.udisks2 = {
    enable = true;
    settings = {
      "udisks2.conf" = {
        defaults = {
          encryption = "luks2";
          btrfs_defaults = "rw,noatime,compress=zstd";
        };
        udisks2 = {
          modules = [
            "*"
          ];
          modules_load_preference = "ondemand";
        };
      };
    };
  };
  services.gvfs.enable = true;
}
