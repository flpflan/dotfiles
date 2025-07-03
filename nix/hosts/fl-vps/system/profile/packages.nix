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
    wget curl gitMinimal foot.terminfo kitty.terminfo
  ];
  environment.stub-ld.enable = false;
  environment.shellAliases = lib.mkForce {};

  programs = {

    zsh = {
	    enable = true;
    };

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
