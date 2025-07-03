{ pkgs, nixpkgs, opiz3-nix, ... }:

{
  imports = [
    "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
  ];

  nixpkgs.hostPlatform = "aarch64-linux";

  # dodge "module <x> not found" error for socs.
  hardware.enableRedistributableFirmware = false;
  nixpkgs.overlays = [
      (final: super: {
      makeModulesClosure = x:
          super.makeModulesClosure (x // { allowMissing = true; });
      })
  ];

  # u-boot, no grub, no efi.
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  # slim supported filesystems.
  boot.supportedFilesystems = pkgs.lib.mkForce ["vfat" "ext4"];
  boot.initrd.supportedFilesystems = pkgs.lib.mkForce ["vfat" "ext4"];

  # your shiny custom kernel.
  boot.kernelPackages = pkgs.orangePiZero3; # however you get the package here is up to you - overlay or directly from the flake.

  # opi needs the uboot image written to a specific part of the firmware.
  sdImage.postBuildCommands = ''dd if=${opiz3-nix.packages.aarch64-linux.ubootOrangePiZero3}/u-boot-sunxi-with-spl.bin of=$img bs=8 seek=1024 conv=notrunc'';

  # this gets burned straight onto an sd. no point in zstd.
  sdImage.compressImage = false;
}
