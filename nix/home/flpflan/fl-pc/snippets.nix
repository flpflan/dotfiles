{
  config,
  fl-dots,
  ...
}: let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in {
  home.file = {
    "snippets".source = outOfStore "${fl-dots}/snippets";
  };
}
