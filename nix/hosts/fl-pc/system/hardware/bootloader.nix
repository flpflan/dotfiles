{ pkgs, ... } :

{
  boot.postBootCommands = ''
    # Enable Num Lock
    for tty in /dev/tty{1..6}; do
      /run/current-system/sw/bin/setleds -D +num < "$tty"
    done
  '';
  boot.consoleLogLevel = 3;
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
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = false;
      theme = "${pkgs.catppuccin-grub}/";
      splashImage = null;
      configurationLimit = 10;
      extraEntries = ''
        menuentry "Arch Linux" --class arch --class gnu-linux --class gnu --class os 'gnulinux-simple-d3074436-1943-4368-98f2-610b49dfab37' {
          insmod part_gpt
          insmod fat
	        search --no-floppy --fs-uuid --set=root D035-E436
	        linux	/vmlinuz-linux-zen root=UUID=d3074436-1943-4368-98f2-610b49dfab37 rw vt.default_red=30,243,166,249,137,245,148,186,88,243,166,249,137,245,148,166 vt.default_grn=30,139,227,226,180,194,226,194,91,139,227,226,180,194,226,173 vt.default_blu=46,168,161,175,250,231,213,222,112,168,161,175,250,231,213,200 mitigations=off nowatchdog resume=UUID=7faaccfe-1ef9-40d3-9238-c63565854bd3
          initrd  /amd-ucode.img /initramfs-linux-zen.img
        }
        submenu 'Advanced options for Arch Linux' $menuentry_id_option 'gnulinux-advanced-d3074436-1943-4368-98f2-610b49dfab37' {
          menuentry 'Arch Linux, with Linux linux (fallback initramfs)' --class arch --class gnu-linux --class gnu --class os 'gnulinux-linux-fallback-d3074436-1943-4368-98f2-610b49dfab37' {
            insmod part_gpt
            insmod fat
            search --no-floppy --fs-uuid --set=root D035-E436
            linux	/vmlinuz-linux-zen root=UUID=d3074436-1943-4368-98f2-610b49dfab37 rw  loglevel=3
            initrd	/amd-ucode.img /initramfs-linux-zen-fallback.img
	        }
        }
        menuentry "Windows" --class windows --class os 'osprober-efi-D035-E436' {
          insmod part_gpt
          insmod fat
          search --no-floppy --fs-uuid --set=root D035-E436
          chainloader /EFI/Microsoft/Boot/bootmgfw.efi
        }
      '';
    };
  };
}
