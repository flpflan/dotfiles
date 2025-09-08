final: prev: let
  inherit (prev) stdenv fetchurl autoPatchelfHook;
  clice = stdenv.mkDerivation rec {
    pname = "clice";
    version = "0.1.0-alpha.1";

    src = fetchurl {
      url = "https://github.com/clice-io/clice/releases/download/v${version}/clice-x86_64-linux-gnu.tar.xz";
      hash = "sha256-ZbUfVKpmlA5fHIlTNrOGN/bTxvBhlvrTSOB2NLKm5Js=";
    };

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      mkdir -p $out/lib
      mv clice $out/bin
      mv lib $out/
      runHook postInstall
    '';

    buildInputs = [stdenv.cc.cc.lib];
    nativeBuildInputs = [autoPatchelfHook];

    doInstallCheck = false;
  };
in {
  inherit clice;
}
