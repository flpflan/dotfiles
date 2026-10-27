{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.visor ];

  boot.loader = {
    efi = {
      # Visor owns the UEFI boot entries; systemd-boot must not touch NVRAM.
      canTouchEfiVariables = false;
      efiSysMountPoint = "/boot";
    };

    # systemd-boot is only the BLS/kernel generator. The firmware boots Visor.
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
      editor = false;
    };

    grub.enable = false;
    limine.enable = false;
  };

  # Install Visor, its icons, the Arch BLS entry and register the UEFI entry.
  system.activationScripts.visor = {
    deps = [ "specialfs" ];
    text = ''
      set -eu

      esp="${config.boot.loader.efi.efiSysMountPoint}"

      if [ -d "$esp" ] && [ -d /sys/firmware/efi ]; then
        ${pkgs.coreutils}/bin/install -Dm0644 \
          ${pkgs.visor}/lib/visor/visor_x64.efi "$esp/EFI/visor/visor.efi"
        ${pkgs.coreutils}/bin/install -Dm0644 \
          ${./visor-boot.conf} "$esp/EFI/visor/boot.conf"

        # Visor's bundled distro/power icons, plus the NixOS icon (Visor's
        # built-in distro_icon map has no NixOS entry; the 0002 patch adds it).
        ${pkgs.coreutils}/bin/install -d "$esp/EFI/visor/icons"
        ${pkgs.coreutils}/bin/cp -r \
          ${pkgs.visor}/share/visor/icons/. "$esp/EFI/visor/icons/"
        ${pkgs.coreutils}/bin/install -Dm0644 \
          ${./visor-icons/nixos.png} "$esp/EFI/visor/icons/nixos.png"

        # Visor skips raw kernel scanning once it finds BLS entries, so Arch
        # is described as a BLS entry instead of relying on auto-detection.
        if [ -f "$esp/vmlinuz-linux-zen" ]; then
          ${pkgs.coreutils}/bin/install -Dm0644 \
            ${./arch-bls.conf} "$esp/loader/entries/arch.conf"
        fi

        if [ -x ${pkgs.efibootmgr}/bin/efibootmgr ]; then
          if ! ${pkgs.efibootmgr}/bin/efibootmgr -v \
              | ${pkgs.gnugrep}/bin/grep -q 'Visor'; then
            src="$(${pkgs.util-linux}/bin/findmnt -n -o SOURCE "$esp" || true)"
            disk="$(${pkgs.util-linux}/bin/lsblk -no PKNAME "$src" 2>/dev/null || true)"
            part="$(${pkgs.util-linux}/bin/lsblk -no PARTN "$src" 2>/dev/null || true)"
            if [ -n "$disk" ] && [ -n "$part" ]; then
              ${pkgs.efibootmgr}/bin/efibootmgr --create \
                --disk "/dev/$disk" --part "$part" \
                --label "Visor" --loader '\EFI\visor\visor.efi' || true
            fi
          fi
        fi
      fi
    '';
  };
}
