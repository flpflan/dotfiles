{
  config,
  pkgs,
  # niri-flake,
  fl-dots,
  ...
}:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = with pkgs; [
    niri
    xwayland-satellite
  ];

  xdg.configFile."niri".source = outOfStore "${dots}/niri";

  # imports = [ niri-flake.homeModules.niri ];
  #
  # programs.niri = {
  #   enable = true;
  #   package = pkgs.niri;
  # };
}
