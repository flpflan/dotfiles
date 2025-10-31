{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    profiles = {
      frontend = {
        extensions = with pkgs.vscode-extensions; [
          ms-ceintl.vscode-language-pack-zh-hans
          github.github-vscode-theme
          christian-kohler.path-intellisense
          esbenp.prettier-vscode
          ecmel.vscode-html-css
          formulahendry.auto-close-tag
          formulahendry.auto-rename-tag
          gruntfuggly.todo-tree
          vue.volar
        ];
        userSettings = {
          "workbench.colorTheme" = "GitHub Dark Colorblind (Beta)";
          "editor.fontFamily" = "'JetBrains Mono Nerd Font', 'monospace', monospace";
          "editor.inlineSuggest.enabled" = true;
          "git.autofetch" = true;
          "[json]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[css]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[html]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[typescript]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[vue]" = {
            "editor.defaultFormatter" = "Vue.volar";
          };
        };
      };
    };
  };
}
