{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # qt6Packages.qt6ct
    qt6ct-kde
    libsForQt5.qt5ct
  ];
}
