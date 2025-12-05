{ config, pkgs, fl-dots, ... }:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  home.packages = [
    # (pkgs.imv.override {
    #   withWindowSystem = "wayland"; # FIXME: cannot build
    # })
    pkgs.imv
  ];

  xdg.configFile."imv" = {
    source = outOfStore "${dots}/imv";
    recursive = false;
  };
  # xdg.desktopEntries = {
  #   imv = {
  #     name = "imv";
  #     genericName = "Image viewer";
  #     comment = "Fast Image Viewer";
  #     exec = "imv %F";
  #     noDisplay = true;
  #     terminal = false;
  #     type = "Application";
  #     categories = ["Graphics"  "2DGraphics" "Viewer"];
  #     mimeType = ["image/x-farbfeld"  "image/tiff"  "image/tiff-fx"  "image/png"  "image/x-png"  "image/jpeg"  "image/jpg"  "image/pjpeg"  "image/svg+xml"  "image/bmp"  "image/x-bmp"  "image/heif"  "image/avif"  "image/jxl"  "image/webp" "image/qoi"];
  #     icon = "multimedia-photo-viewer";
  #   };
  #   imv-dir = {
  #     name = "imv-dir";
  #     genericName = "Image viewer";
  #     comment = "Fast Image Viewer | Open all images in a directory";
  #     exec = "imv-dir %F";
  #     noDisplay = true;
  #     terminal = false;
  #     type = "Application";
  #     categories = ["Graphics" "2DGraphics" "Viewer"];
  #     mimeType = ["image/x-farbfeld" "image/tiff" "image/tiff-fx" "image/png" "image/x-png"  "image/jpeg"  "image/jpg"  "image/pjpeg"  "image/svg+xml"  "image/bmp"  "image/x-bmp"  "image/heif"  "image/avif"  "image/jxl"  "image/webp" "image/qoi"];
  #     icon = "multimedia-photo-viewer";
  #   };
  # };
}
