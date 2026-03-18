{ pkgs, ... }:

{
  home.packages = with pkgs; [
      lxgw-wenkai-screen
      # lxgw-neoxihei
      fira
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      merriweather-sans
      merriweather
      # source-han-sans
      # source-han-serif
      # noto-fonts-cjk-sans
      # noto-fonts-cjk-serif
      # source-sans-pro
      # hack-font
      noto-fonts-color-emoji
      misans
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [
        "Noto Color Emoji"
      ];
      monospace = [
        "FiraCode Nerd Font"
        # "LXGW Neo XiHei Screen Full"
        # "Noto Sans"
        "MiSans"
      ];
      sansSerif = [
        "Merriweather Sans"
        # "LXGW Neo XiHei Screen Full"
        # "Source Han Sans JP"
        # "Noto Sans"
        "MiSans"
      ];
      serif = [
        "Merriweather"
        # "LXGW Neo XiHei Screen Full"
        # "Source Han Serif JP"
        # "Noto Serif"
        "LXGW WenKai Screen"
      ];
    };
  };
}
