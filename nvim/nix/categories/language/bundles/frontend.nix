{tools, ...} @ inputs: let
  source = file: import file inputs;

  html-css = source ../html-css.nix;
  typescript = source ../typescript.nix;
  vue = source ../vue.nix;
in
  tools.recursiveMerge [html-css typescript vue]
