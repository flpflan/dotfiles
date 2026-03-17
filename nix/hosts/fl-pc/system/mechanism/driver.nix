{ pkgs, ... }:

{
  services.udev.extraHwdb = ''
    evdev:input:b0003v1EA7p0064*
     KEYBOARD_KEY_90004=forward
     KEYBOARD_KEY_90005=back
  '';

  # hardware.opentabletdriver.enable = true;
  environment.systemPackages = [ pkgs.huion-hc16-driver ];
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0666"
  '';
}
