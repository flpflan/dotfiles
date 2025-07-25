{ config, pkgs, fl-dots, ... }:

let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in 
{
  home.packages = with pkgs; [
    ncdu duf 
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      source ${outOfStore "${fl-dots}/fish/config.fish"}
      source ${outOfStore "${fl-dots}/fish/functions/fish_greeting.fish"}

      alias rgrep="$(which grep)"; alias grep="rg"
      alias rfind=$"(which find)"; alias find="fd"
      alias rnvim="$(which vim)"; alias vim="nvim"
      alias rcat="$(which cat)"; alias cat="bat"
      alias rdf="$(which df)";   alias df="duf"
      alias rdu="$(which du)"; alias du="ncdu"
      alias rls="$(which ls)"; alias ls="eza"

      alias lsgit="eza -l --git"
      alias sudo="sudo -E"
      # alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
    '';

    functions."yy" = ''
      set -l tmp (mktemp -t "yazi-cwd.XXXXX")
      command yazi $argv --cwd-file="$tmp"
      if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
      end
      rm -f -- "$tmp"
    '';

    binds = {
      "ctrl-q".command = "exit";
      "ctrl-q".silent = true;

      "ctrl-t".command = "yy";
      "ctrl-t".silent = true;
    };
  };

  programs.zoxide.enable = true;
  programs.zoxide.enableFishIntegration = true;

  programs.fzf.enable = true;
  programs.fzf.enableFishIntegration = true;

  programs.eza.enable = true;
  programs.eza.enableFishIntegration = true;

  programs.ripgrep.enable = true;

  programs.bat.enable = true;

  programs.fd.enable = true;

  programs.nix-index.enable = true;
  programs.nix-index.enableFishIntegration = true;
}

