{ huion-driver, ... }:

{
  services.udev.extraHwdb = ''
    evdev:input:b0003v1EA7p0064*
     KEYBOARD_KEY_90004=forward
     KEYBOARD_KEY_90005=back
  '';

  imports = [ huion-driver.nixosModules.default ];
  programs.huionDriver = {
    enable = true;
    package = huion-driver.packages.x86_64-linux.huionDriverCN;
  };
}
