{
  config,
  pkgs,
  fl-dots,
  ...
}: let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in {
  home.packages = with pkgs; [
    ncdu
    duf
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      source ${outOfStore "${dots}/fish/config.fish"}
      source ${outOfStore "${dots}/fish/functions/fish_greeting.fish"}

      alias rgrep="$(which grep)"; alias grep="rg"
      alias rfind="$(which find)"; alias find="fd"
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
  programs.fzf.defaultOptions = ["--style=full"];
  programs.fzf.colors = {
    "bg+" = "#313244";
    spinner = "#F5E0DC";
    hl = "#F38BA8";
    fg = "#CDD6F4";
    header = "#F38BA8";
    info = "#93F1E5";
    pointer = "#F5E0DC";
    marker = "#A7F3EA";
    "fg+" = "#CDD6F4";
    prompt = "#7EEEE1";
    "hl+" = "#F38BA8";
    selected-bg = "#45475A";
    border = "#6C7086";
    label = "#CDD6F4";
  };

  programs.eza.enable = true;
  programs.eza.enableFishIntegration = true;

  programs.ripgrep.enable = true;

  programs.bat.enable = true;

  programs.fd.enable = true;

  programs.nix-index.enable = true;
  programs.nix-index.enableFishIntegration = true;
}
