{
  imports = [ ./grub.nix ];

  boot.postBootCommands = ''
    # Enable Num Lock
    for tty in /dev/tty{1..6}; do
      /run/current-system/sw/bin/setleds -D +num < "$tty"
    done
  '';
  boot.consoleLogLevel = 3;
}
