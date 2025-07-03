{
  boot.loader.grub = {
    efiSupport = false;
    # efiInstallAsRemovable = true;
    device = "/dev/vda";
    forceInstall = true;
  };
}
