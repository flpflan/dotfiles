{
  lib,
  stdenv,
  fetchFromGitHub,
  gnu-efi,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "visor";
  version = "1.5.8";

  src = fetchFromGitHub {
    owner = "IO-ZetZor";
    repo = "Visor-BootManager";
    rev = "v${finalAttrs.version}";
    hash = "sha256-mkGP7T7j0jZU6/EoxmyzJZC9Cj72mOO48ebihuAiuUA=";
  };

  nativeBuildInputs = [ gnu-efi ];

  enableParallelBuilding = true;

  postPatch = ''
    patch -p1 < ${./0001-sort-bls-generations-newest-first.patch}
    patch -p1 < ${./0002-add-nixos-icon.patch}
    patch -p1 < ${./0003-rename-windows-entry.patch}
  '';

  buildPhase = ''
    runHook preBuild

    make ARCH=x86_64 \
      GNU_EFI_INC=${gnu-efi}/include/efi \
      CRT0=${gnu-efi}/lib/crt0-efi-x86_64.o \
      GNU_EFI_LIB=${gnu-efi}/lib

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    install -Dm0644 visor_x64.efi $out/lib/visor/visor_x64.efi
    install -Dm0755 visor $out/bin/visor
    install -Dm0644 boot.conf.example $out/share/visor/boot.conf.example
    install -Dm0644 docs/boot.conf.schema.json $out/share/visor/boot.conf.schema.json
    install -Dm0644 LICENSE $out/share/licenses/visor/LICENSE

    # Bundled distro and power icons, copied to the ESP by the activation script.
    mkdir -p $out/share/visor
    cp -r assets/icons $out/share/visor/icons

    runHook postInstall
  '';

  meta = {
    description = "Minimal graphical UEFI boot manager";
    homepage = "https://github.com/IO-ZetZor/Visor-BootManager";
    license = lib.licenses.bsd2;
    mainProgram = "visor";
    platforms = [ "x86_64-linux" ];
    maintainers = [ ];
  };
})
