{ lib, pkgs, quickshell, ... }:

let
  qs = quickshell.packages."${pkgs.system}".default.override {
    withJemalloc = true;
    withQtSvg = true;
    withWayland = true;
    withX11 = false;
    withPipewire = true;
    withPam = true;
    withHyprland = true;
    withI3 = false;
  };
  deps = with pkgs; [
    # Cmdline tools
    git curl jq ibm-plex fd fish 
    cava ddcutil brightnessctl imagemagick bluez networkmanager
    # Python dependencies
    (
      python3.withPackages (ps: with ps; [
        aubio pyaudio numpy
      ])
    )
    # app2unit
  ];
  fontconfig = pkgs.makeFontsConf {
    fontDirectories = with pkgs; [
      material-symbols nerd-fonts.jetbrains-mono
    ];
  };
  qs-wrapped = pkgs.symlinkJoin {
    name = "quickshell-caelestia";
    paths = [ qs ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/qs \
      --set FONTCONFIG_FILE "${fontconfig}" \
      --add-flags "-c caelestia"
    '';

    meta.mainProgram = "quickshell";
  };
in
pkgs.writeShellScriptBin "qs" ''
  export PATH=${lib.makeBinPath deps}:$PATH
  exec ${qs-wrapped}/bin/qs "$@"
''
