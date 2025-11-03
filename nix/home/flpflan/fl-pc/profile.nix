{
  config,
  fl-dots,
  ...
}: let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in {
  home.file = {
    "Pictures/wallpaper".source = outOfStore "${fl-dots}/wallpaper";
  };
}
