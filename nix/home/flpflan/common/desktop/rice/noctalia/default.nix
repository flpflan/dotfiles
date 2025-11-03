{
  config,
  tools,
  ...
}: {
  imports = [
    (tools.relative "<noctalia-shell>")
    (tools.relative "<noctalia-nixos>")
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = {};
  };
  services.noctalia-shell = {
    enable = true;
    target = config.wayland.systemd.target;
  };
}
