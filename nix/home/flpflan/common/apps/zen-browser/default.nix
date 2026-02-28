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
        settings = {
          "general.smoothScroll.msdPhysics.enabled" = false;
          "browser.tabs.inTitlebar" = 0;
          "browser.tabs.allow_transparent_browser" = true;
          "widget.transparent_windows" = true;
          "zen.widget.linux.transparency" = true;
          "zen.theme.gradient.show-custom-colors" = true;
          "zen.view.grey-out-inactive-windows" = false;
        };
      };
  };
}
