{pkgs, ...}: {
  home.packages = with pkgs; [
    clang lld gnumake
  ];
}
