{
  config,
  pkgs,
  fl-dots,
  ...
}:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = with pkgs; [
    qt6Packages.qt6ct
    # qt6ct-kde
    libsForQt5.qt5ct
    # libsForQt5.qtstyleplugin-kvantum
  ];

  xdg.configFile."qt5ct".source = outOfStore "${dots}/qt5ct";
  xdg.configFile."qt6ct".source = outOfStore "${dots}/qt6ct";
}
