final: prev: let
  inherit (prev) stdenv fetchurl autoPatchelfHook makeWrapper;
  clice = stdenv.mkDerivation rec {
    pname = "clice";
    version = "0.1.0-alpha.2";

    src = fetchurl {
      url = "https://github.com/clice-io/clice/releases/download/v${version}/clice-x86_64-linux-gnu.tar.xz";
      hash = "sha256-ulk0KCqs0mrgBjt10SZbh97Hvbspt3Xs/oCyamda3JQ=";
    };

    installPhase = ''
      runHook preInstall

      install -Dt "$out"/bin bin/clice
      cp -r lib clice.toml $out
      wrapProgram $out/bin/clice \
        --add-flags "--resource-dir $out/lib/clang/20"

      runHook postInstall
    '';

    buildInputs = [stdenv.cc.cc.lib];
    nativeBuildInputs = [autoPatchelfHook makeWrapper];

    doInstallCheck = false;
  };
in {
  inherit clice;
}
