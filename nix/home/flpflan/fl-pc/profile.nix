{
  config,
  fl-dots,
  ...
}: let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in {
  home.file = {
    "Pictures/wallpaper".source = outOfStore "${fl-dots}/wallpaper";
    "profile/snippets".source = outOfStore "${fl-dots}/snippets";
  };
}
