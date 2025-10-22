final: prev: let
  inherit (prev) stdenvNoCC fetchurl versionCheckHook;
  some-sass-language-server = stdenvNoCC.mkDerivation rec {
    pname = "some-sass-language-server";
    version = "2.3.5";

    src = fetchurl {
      url = "https://registry.npmjs.org/some-sass-language-server/-/some-sass-language-server-${version}.tgz";
      hash = "sha256-H1RE6l1SD/ma4Y7em/CZI26mAf+yok1z7ENW2KZ7Oys=";
    };

    installPhase = ''
      runHook preInstall

      mkdir -p $out
      mv bin dist package.json $out/

      runHook postInstall
    '';

    buildInputs = [final.nodejs];

    doInstallCheck = true;
    versionCheckProgramArg = "--version";
    nativeInstallCheckInputs = [versionCheckHook];
  };
in {
  inherit some-sass-language-server;
}
