{ lib, pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons =  with pkgs; [
        # fcitx5-gtk # Needed in x11
        fcitx5-mozc
        # fcitx5-chinese-addons # We use rime instead of this

        fcitx5-material-color

        rime-zhwiki
        nur.repos.xyenon.rime-moegirl

        # fcitx5-rime.override {
        #   rimeDataPkgs = [ nur.repos.xyenon.rime-ice ];
        # }
        fcitx5-rime
        nur.repos.xyenon.rime-ice
      ];
      settings = {
        addons = {
          classicui.globalSection.Theme = lib.mkDefault "Material-Color-deepPurple";
          classicui.globalSection.DarkTheme = lib.mkDefault "Material-Color-deepPurple";
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
