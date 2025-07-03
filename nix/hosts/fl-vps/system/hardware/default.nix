{ modulesPath, ...}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    (modulesPath + "/profiles/headless.nix")
    # (modulesPath + "/profiles/minimal.nix")
    ./bootloader.nix
    ./kernel.nix
    ./disk.nix
  ];
  facter.reportPath = ./facter.json;
}
