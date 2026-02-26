{
    services.udev.extraHwdb = ''
        evdev:input:b*
          KEYBOARD_KEY_275=back
          KEYBOARD_KEY_276=forward
    '';
}
