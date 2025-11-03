{
  pkgs,
  tools,
  ...
}: {
  imports = map tools.relative [
    "home/flpflan/common/QoL/mpv"
    "home/flpflan/common/QoL/imv"
    "home/flpflan/common/QoL/go-musicfox"
  ];
}
