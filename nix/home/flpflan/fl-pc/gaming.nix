{ pkgs, tools, ... }:

{
  imports = [
    (tools.relative "home/flpflan/common/apps/prism-launcher")
  ];

  home.packages = with pkgs; [
    # bottles
  ];
}
