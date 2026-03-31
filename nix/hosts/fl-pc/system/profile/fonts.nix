{ pkgs, ... }:

{
  fonts = {
    # packages = with pkgs; [
    #   lxgw-wenkai-screen
    #   nerd-fonts.fira-code
    #   merriweather-sans
    #   merriweather
    #   source-han-sans
    #   source-han-serif
    #   noto-fonts-color-emoji
    # ];
    fontconfig = {
      enable = true;
      useEmbeddedBitmaps = true;
      # antialias = true;
      # hinting.enable = true; # For low resolution
      # defaultFonts = {
      #   emoji = [
      #     "Noto Color Emoji"
      #   ];
      #   monospace = [
      #     "FiraCode Nerd Font"
      #     "LXGW Neo XiHei Screen Full"
      #   ];
      #   sansSerif = [
      #     "Merriweather Sans"
      #     "LXGW Neo XiHei Screen Full"
      #     "Source Han Sans JP"
      #   ];
      #   serif = [
      #     "Merriweather"
      #     "LXGW Neo XiHei Screen Full"
      #     "Source Han Serif JP"
      #   ];
      # };
    };
  };
}
