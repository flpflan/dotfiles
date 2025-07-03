{ lib, config, ... }:

{
  # nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux"; # No need when use facter
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
