{
  pkgs,
  quickshell,
  fetchFromGitHub,
  ...
}:

let
  shortRev = rev: builtins.substring 0 7 rev;

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
    # TODO:
    app2unit
    aubio
    # bluez
    brightnessctl
    cava
    # curl
    ddcutil
    fishMinimal
    grim
    inotify-tools
    libqalculate
    lm_sensors
    # material-symbols
    # nerd-fonts.jetbrains-mono
    networkmanager
    pipewire
    # power-profiles-daemon
    # procps
    kdePackages.qtdeclarative
    qs
    swappy
  ];
  fontconfig = pkgs.makeFontsConf {
    fontDirectories = with pkgs; [
      material-symbols nerd-fonts.jetbrains-mono
    ];
  };
in

pkgs.stdenv.mkDerivation rec {
  pname = "caelestia-shell";
  src = fetchFromGitHub {
    # owner = "caelestia-dots";
    # repo = "shell";
    # rev = "ad22b1e7e6067bc9a0304048e7bf2f712769f4f5";
    # sha256 = "sha256-3xL8yg61J5w4o1zkunTYxqlb1C+BAt7uaZJLNZlOkRQ=";
    owner = "pinksteven";
    repo = "caelestia-shell";
    rev = "48922fc9273a7d8165a26d8b7aff33e6e764218c";
    sha256 = "sha256-z2AKOtFH57Q7/IlpzRdideYdr1pF8pakqD+x5E7HRFM=";
  };
  # version = self.shortRev or "dirty";
  version = shortRev src.rev;

  nativeBuildInputs = with pkgs; [
    gcc
    makeWrapper
  ];

  buildInputs = deps;
  dontWrapQtApps = true;

  buildPhase = ''
    mkdir -p bin
    g++ -std=c++17 -Wall -Wextra \
    -I${pkgs.pipewire.dev}/include/pipewire-0.3 \
    -I${pkgs.pipewire.dev}/include/spa-0.2 \
    -I${pkgs.aubio}/include/aubio \
    assets/beat_detector.cpp \
    -o bin/beat_detector \
    -lpipewire-0.3 -laubio
  '';

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/quickshell
    mkdir -p $out/usr/lib/caelestia

    cp -r assets config modules services utils widgets $out/share/quickshell/
    cp shell.qml $out/share/quickshell/
    cp bin/beat_detector $out/usr/lib/caelestia
    mv run.fish $out/bin/caelestia-shell
    chmod +x $out/bin/caelestia-shell

    # Passing entire qs command via the script
    sed -i "/qs/i \
    if count \$argv > \/dev\/null \
    \n  qs -p $out\/share\/quickshell \$argv \
    \nelse" $out/bin/caelestia-shell

    sed -i "/\$cache/a end" $out/bin/caelestia-shell

    substituteInPlace $out/bin/caelestia-shell --replace-quiet "qs -p (dirname (status filename))" "  qs -p $out/share/quickshell"
  '';

  postFixup = ''
    wrapProgram $out/bin/caelestia-shell \
    --set CAELESTIA_BD_PATH "$out/usr/lib/caelestia/beat_detector" \
    --prefix PATH : ${pkgs.lib.makeBinPath deps} \
    --set FONTCONFIG_FILE "${fontconfig}"
    # --prefix FONTCONFIG_PATH : ${pkgs.fontconfig}/etc/fonts
    # --set QT_QUICK_CONTROLS_STYLE Basic
  '';
}
