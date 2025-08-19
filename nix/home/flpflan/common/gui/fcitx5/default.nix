{
  config,
  pkgs,
  fl-dots,
  ...
}: let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        # 插件/引擎
        # fcitx5-gtk # Needed in x11
        fcitx5-mozc
        # fcitx5-chinese-addons # We use rime instead of this
        (fcitx5-rime.override {
          rimeDataPkgs = [
            # 词库
            rime-ice
            rime-zhwiki
            rime-moegirl
          ];
        })

        # 主題
        fcitx5-fluent
        fcitx5-mellow-themes
      ];
      settings = {
        globalOptions = {
          Hotkey = {
            TriggerKeys = "";
          };
        };
        addons = {
          classicui.globalSection.Theme = "FluentDark";
          classicui.globalSection.DarkTheme = "FluentDark";
          classicui.globalSection.UseDarkTheme = true; # 跟随系统浅色/深色设置

          clipboard.sections = {"TriggerKey" = "";};
        };
        inputMethod = {
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "keyboard-us";
          };
          "Groups/0/Items/0".Name = "rime";
          "Groups/0/Items/1".Name = "keyboard-us";
          "Groups/0/Items/2".Name = "mozc";
          GroupOrder."0" = "Default";
        };
      };
    };
  };

  xdg.dataFile."fcitx5/rime/default.custom.yaml".source = outOfStore "${fl-dots}/fcitx5/rime/default.custom.yaml";
  xdg.dataFile."fcitx5/rime/rime_ice.custom.yaml".source = outOfStore "${fl-dots}/fcitx5/rime/rime_ice.custom.yaml";
  xdg.dataFile."fcitx5/rime/rime_ice.dict.yaml".source = outOfStore "${fl-dots}/fcitx5/rime/rime_ice.dict.yaml";
}
