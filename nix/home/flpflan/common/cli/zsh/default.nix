{ config, pkgs, fl-dots, ... }:

let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  home.packages = with pkgs; [
    atuin zoxide ncdu duf bat fd eza ripgrep fzf nix-index
  ];

  programs.zsh = {
    enable = true;
    dotDir = ".config/zshrc.d";
    history.path = "${config.xdg.dataHome}/zsh/zsh_history";
    completionInit = "";
    initContent = ''
      source ${outOfStore "${fl-dots}/zsh/.zshrc"}
    '';
  };

  xdg.configFile."zshrc.d/p10k-tty.zsh".source = outOfStore "${fl-dots}/zsh/zshrc.d/p10k-tty.zsh";
  xdg.configFile."zshrc.d/command-not-found.sh".source = "${pkgs.nix-index}/etc/profile.d/command-not-found.sh";
}

