{pkgs, ...}: let
  general-fhs-env = let
    base = pkgs.appimagetools.defaultfhsenvargs;
  in
    pkgs.buildfhsenv (base
      // {
        name = "fhs";
        targetpkgs = pkgs:
          (base.targetpkgs pkgs)
          ++ (
            with pkgs; [
              pkg-config
              # ncurses
              # Other dependencies
            ]
          );
        profile = "export fhs=1";
        runscript = "bash";
        extraoutputstoinstall = ["dev"];
      });
in {
  home.packages = with pkgs; [
    # steam-run-free
    general-fhs-env
  ];
}
