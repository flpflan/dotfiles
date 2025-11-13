{pkgs, config, ...}:

let
  inherit (config.home) homeDirectory;
  # toolchain = pkgs.rustPlatform;
in 
{
  home.packages = with pkgs; [
    cargo
    clippy
    rustc
    # (with toolchain; [
    #   rustLibSrc
    # ])
  ];
  # home.sessionVariables.RUST_SRC_PATH = "${toolchain.rustLibSrc}";

  home.sessionPath = [
    "${homeDirectory}/.cargo/bin"
  ];
}
