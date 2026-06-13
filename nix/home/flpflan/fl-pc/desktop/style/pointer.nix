{ pkgs, ... }:

{
  home.packages = [
    pkgs.bibata-cursors
    # (pkgs.runCommand "make-pointers"
    #   {
    #     src = fl-dots;
    #     nativeBuildInputs = [ pkgs.unzip ];
    #   }
    #   ''
    #     mkdir -p $out/share/icons
    #     unzip $src/assets/cursor/Koishi.zip -d $out/share/icons
    #     # for zip in $src/assets/cursor/*.zip; do
    #     #   unzip "$zip" -d $out/share/icons
    #     # done
    #   ''
    # )
  ];
}
