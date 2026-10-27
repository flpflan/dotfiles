# {
#   pkgs,
#   config,
#   fl-dots,
#   ...
# }:
#
# let
#   dots = "${fl-dots}/dots";
#   outOfStore = config.lib.file.mkOutOfStoreSymlink;
# in
{
  wayland.windowManager.wayfire.enable = true;
}
