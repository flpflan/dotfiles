{ config, ... }:

{
  boot.loader.grub = {
    enable = !config.boot.isContainer;
    default = "saved";
    # efiInstallAsRemovable = true;
    devices = [ "/dev/vda" ];
  };
}
