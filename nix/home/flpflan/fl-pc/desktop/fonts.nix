{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # lxgw-wenkai-screen
      # lxgw-neoxihei-screen-full
      # fira
      nerd-fonts.fira-code
      # nerd-fonts.jetbrains-mono
      merriweather-sans
      merriweather
      source-han-sans
      source-han-serif
      # noto-fonts-cjk-sans
      # noto-fonts-cjk-serif
      # source-sans-pro
      # hack-font
      noto-fonts-color-emoji
      # misans
  ];
  fonts.fontconfig = {
    enable = true;
    hinting = "full";
    # antialiasing = true; # This causes Noto Color Emoji not rendering
    # subpixelRendering = "rgb";
    defaultFonts = {
      emoji = [
        "Noto Color Emoji"
      ];
      monospace = [
        "FiraCode Nerd Font"
        # "LXGW Neo XiHei Screen Full"
        "思源黑体"
        # "MiSans"
        "Source Han Sans SC"
        "Source Han Sans TC"
        "Source Han Sans HW"
        "Source Han Sans K"
        # "Noto Sans Mono CJK SC"
        # "Noto Sans Mono CJK TC"
        # "Noto Sans Mono CJK JP"
      ];
      sansSerif = [
        "Merriweather Sans"
        # "LXGW Neo XiHei Screen Full"
        "思源黑体"
        # "MiSans"
        "Source Han Sans SC"
        "Source Han Sans TC"
        "Source Han Sans HW"
        "Source Han Sans K"
        # "Noto Sans CJK SC"
        # "Noto Sans CJK TC"
        # "Noto Sans CJK JP"
      ];
      serif = [
        "Merriweather"
        "思源宋体"
        # "LXGW WenKai Screen"
        "Source Han Serif SC"
        "Source Han Serif TC"
        "Source Han Serif HW"
        "Source Han Serif K"
        # "Source Han Serif JP"
        # "Noto Serif CJK SC"
        # "Noto Serif CJK TC"
        # "Noto Serif CJK JP"
      ];
    };
  };
}
