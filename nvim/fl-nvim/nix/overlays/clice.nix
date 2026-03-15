final: prev: let
  inherit (prev) stdenv fetchurl autoPatchelfHook makeWrapper;
  clice = stdenv.mkDerivation rec {
    pname = "clice";
    version = "0.1.0-alpha.4";

    src = fetchurl {
      url = "https://github.com/clice-io/clice/releases/download/v${version}/clice-x86_64-linux-gnu.tar.gz";
      hash = "sha256-sNwIQHrlpbSABYUATZYNe6SlH75+RevivK5/q+M8f+Q=";
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
