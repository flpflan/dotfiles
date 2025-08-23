{
  pkgs,
  tools,
  ...
}: {
  imports = map tools.relative [
    "home/flpflan/common/gui/mpv"
    "home/flpflan/common/gui/imv"
    "home/flpflan/common/gui/go-musicfox"
  ];
}
