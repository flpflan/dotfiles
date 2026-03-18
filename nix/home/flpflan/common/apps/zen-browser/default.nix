{ zen-browser, ... }:

{
  imports = [
    zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    profiles."fl-priv" = {
      sine = {
        enable = true;
        # mods = [ "Neo-Zen" ];
      };
      settings = {
        "general.smoothScroll.msdPhysics.enabled" = false;
        "browser.tabs.inTitlebar" = 0;
        "browser.tabs.allow_transparent_browser" = true;
        "widget.transparent_windows" = true;
        "zen.widget.linux.transparency" = true;
        "zen.theme.gradient.show-custom-colors" = true;
        "zen.view.grey-out-inactive-windows" = false;

        "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # Enable userChrome.css

        "browser.download.dir" = "/home/flpflan/Downloads";

        # "sine.engine.auto-update" = false;
      };
    };
  };
}
