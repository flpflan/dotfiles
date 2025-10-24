{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    profiles = {
      frontend = {
        extensions = with pkgs.vscode-extensions; [
          github.github-vscode-theme
          vue.volar
        ];
      };
    };
  };
}
