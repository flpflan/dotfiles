{ zen-browser, ... }:

{
  imports = [
    zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    suppressXdgMigrationWarning = true;
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
