{
  config,
  fl-dots,
  ...
}: let
  assets = "${fl-dots}/assets";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in {
  home.file = {
    ".face".source = outOfStore "${assets}/face_koishi";

    "Pictures/wallpaper".source = outOfStore "${fl-dots}/wallpaper";
    "profile/snippets".source = outOfStore "${fl-dots}/snippets";
  };
}
