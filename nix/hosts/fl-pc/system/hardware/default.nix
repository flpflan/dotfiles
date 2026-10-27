{ modulesPath, ...}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    # (modulesPath + "/profiles/headless.nix")
    # (modulesPath + "/profiles/minimal.nix")
    ./bootloader
    ./kernel.nix
    ./disk.nix
    ./cpu.nix
  ];

  facter.reportPath = ./facter.json;
}
