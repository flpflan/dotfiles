final: prev: let
  inherit (prev) stdenv fetchurl autoPatchelfHook makeWrapper;
  clice = stdenv.mkDerivation rec {
    pname = "clice";
    version = "0.1.2026072210";

    src = fetchurl {
      url = "https://github.com/clice-io/clice/releases/download/v${version}/clice-x64-linux-gnu.tar.gz";
      hash = "sha256-HlWU//05C9PlSKsJMVXCP1SdL/yGEMbTkrJzZcRuk4k=";
    };

    unpackPhase = ''
      tar -xzf $src
    '';

    installPhase = ''
      runHook preInstall

      install -Dt "$out"/bin clice/bin/clice
      cp -r clice/lib clice/clice.toml $out
      # wrapProgram $out/bin/clice \
      #   --add-flags "--resource-dir $out/lib/clang/21"

      runHook postInstall
    '';

    buildInputs = [stdenv.cc.cc.lib];
    nativeBuildInputs = [autoPatchelfHook makeWrapper];

    doInstallCheck = false;
  };
in {
  inherit clice;
}
