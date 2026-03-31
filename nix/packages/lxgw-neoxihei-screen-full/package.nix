{
  fetchurl,
  stdenvNoCC,
}:

stdenvNoCC.mkDerivation rec {
  pname = "lxgw-neoxihei-screen-full";
  version = "26.02.27";

  src = fetchurl {
    url = "https://github.com/lxgw/LxgwNeoXiZhi-Screen/releases/download/${version}/LXGWNeoXiHeiScreenFull.ttf";
    hash = "sha256-GKMCBF4UdFGr+4hkc59+t0F+1P08DMu77QMxNI9E2FA=";
  };

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    install -Dm644 $src $out/share/fonts/truetype/LXGWNeoXiHeiScreenFull.ttf

    runHook postInstall
  '';
}
