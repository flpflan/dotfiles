{ tools, ... }:
let
  inherit (tools) module;
in 
{
  imports = [
    (module "<zen-browser-home-manager>")
  ];

  programs.zen-browser = {
      enable = true;
      profiles."fl-priv" = {
        sine.enable = true;
      };
  };
}
