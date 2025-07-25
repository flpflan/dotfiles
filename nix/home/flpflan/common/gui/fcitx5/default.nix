{ pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons =  with pkgs; [
        # 插件/引擎
        # fcitx5-gtk # Needed in x11
        fcitx5-mozc
        # fcitx5-chinese-addons # We use rime instead of this
        # fcitx5-rime.override {
        #   rimeDataPkgs = [ nur.repos.xyenon.rime-ice ];
        # }
        fcitx5-rime

        # 词库
        rime-zhwiki
        nur.repos.xyenon.rime-moegirl
        nur.repos.xyenon.rime-ice

        # 主題
        fcitx5-fluent
        fcitx5-mellow-themes
      ];
      settings = {
        addons = {
          classicui.globalSection.Theme = "FluentLight";
          classicui.globalSection.DarkTheme = "FluentDark";
          classicui.globalSection.UseDarkTheme = false; # 跟随系统浅色/深色设置 
          # pinyin.globalSection = {
          #   PageSize = 9;
          #   CloudPinyinEnabled = "True";
          #   CloudPinyinIndex = 2;
          # };
          # cloudpinyin.globalSection = {
          #   Backend = "Baidu";
          # };
        };
        inputMethod = {
          # "Groups/0" = {
          #   Name = "Default";
          #   "Default Layout" = "us";
          #   DefaultIM = "keyboard-us";
          # };
          # "Groups/0/Items/0".Name = "keyboard-us";
          # "Groups/0/Items/1".Name = "pinyin";
          # GroupOrder."0" = "Default";
        };
      };
    };
  };
}
