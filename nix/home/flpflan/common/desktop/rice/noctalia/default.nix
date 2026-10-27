{
  config,
  fl-dots,
  ...
}:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in
{
  programs.noctalia = {
    enable = true;
    checkConfig = false;
  };

  xdg.configFile."noctalia".source = outOfStore "${dots}/noctalia";
}
