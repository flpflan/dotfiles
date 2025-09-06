{pkgs, ...}: let
  toolchain = pkgs.rustPlatform;
in {
  home.packages = with toolchain; [
    # cargo
    # rustc
    rustLibSrc
  ];
  home.sessionVariables.RUST_SRC_PATH = "${toolchain.rustLibSrc}";
}
