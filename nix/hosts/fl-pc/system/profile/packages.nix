{ pkgs, lib, ... }:

{
  documentation = {
    enable = false;
    doc.enable = false;
    info.enable = false;
    man.enable = false;
    nixos.enable = false;
  };

  programs.command-not-found.enable = false;

  environment.defaultPackages = lib.mkForce [];
  environment.systemPackages = with pkgs; [
    wget comma
  ];
  environment.stub-ld.enable = false;
  environment.shellAliases = lib.mkForce {};

  programs = {

    # hyprland = {
    #   enable = true;
    #   xwayland.enable = true;
    # };

    nano.enable = false;

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    less = {
      enable = true;
      lessopen = null;
    };

  };
}
