# NOTE: Taken from https://github.com/nix-community/nur-combined/blob/main/repos/guanran928/pkgs/misans/package.nix
{
  lib,
  stdenvNoCC,
  fetchzip,
  type ? "ttf",
}:
assert lib.assertOneOf "misans: `type`" type [
  "otf"
  "ttf"
  "vf"
  "woff"
  "woff2"
];
stdenvNoCC.mkDerivation {
  pname = "misans";
  version = "4.003"; # from font metadata

  src = fetchzip {
    url = "https://hyperos.mi.com/font-download/MiSans.zip";
    hash = "sha256-MH4t7oXDUiH1TAm0xKa0AENmB1zoedd8X5BcQFNw8GM=";
    stripRoot = false;
  };

  dontPatch = true;
  dontConfigure = true;
  dontBuild = true;
  doCheck = false;
  dontFixup = true;

  installPhase =
    let
      type' =
        {
          otf = "opentype";
          ttf = "truetype";
          vf = "truetype";
        }
        .${type} or type;

      dir = if (type == "vf") then ''MiSans\ VF.ttf'' else "${type}/MiSans-*";
    in
    ''
      runHook preInstall

      install -Dm644 -t $out/share/fonts/${type'} MiSans/${dir}

      runHook postInstall
    '';
}
