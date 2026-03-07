{
  pkgs,
  lib,
  ...
}: {
  documentation = {
    enable = false;
    doc.enable = false;
    info.enable = false;
    man.enable = false;
    nixos.enable = false;
  };

  environment.defaultPackages = lib.mkForce [];
  environment.systemPackages = with pkgs; [
    wget
    curl
    gitMinimal
  ];
  environment.stub-ld.enable = false;
  environment.shellAliases = lib.mkForce {};

  programs = {
    fish = {
      enable = true;
    };

    zsh = {
      enable = false;
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
