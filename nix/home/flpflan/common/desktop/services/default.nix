{ tools, ... }:

{
  imports = tools.scan ./.;

  services.polkit-gnome.enable = true;
  # services.hyprpolkitagent.enable = true;
}
