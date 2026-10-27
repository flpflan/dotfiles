{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    limine = {
      enable = false;
      enableEditor = false;
      maxGenerations = 10;
      extraEntries = ''
        /Arch Linux
          protocol: linux
          kernel_path: boot():/vmlinuz-linux-zen
          cmdline: root=UUID=d3074436-1943-4368-98f2-610b49dfab37 rw  loglevel=3 quiet
          module_path: boot():/initramfs-linux-zen.img

        /Windows
          protocol:efi
          path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
      '';
      style = {
        wallpapers = [ ];
        graphicalTerminal = {
          palette = "1e1e2e;f38ba8;a6e3a1;f9e2af;89b4fa;f5c2e7;94e2d5;cdd6f4";
          brightPalette = "585b70;f38ba8;a6e3a1;f9e2af;89b4fa;f5c2e7;94e2d5;cdd6f4";
          background = "1e1e2e";
          foreground = "cdd6f4";
          brightBackground = "585b70";
          brightForeground = "cdd6f4";
          font.scale = "2x2";
        };
      };
    };

  };
}
