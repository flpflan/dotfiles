{pkgs, ...}: let
  general-fhs-env = let
    base = pkgs.appimageTools.defaultFhsEnvArgs;
  in
    pkgs.buildFHSEnv (base
      // {
        name = "fhs";
        targetPkgs = pkgs:
          (base.targetPkgs pkgs)
          ++ (
            with pkgs; [
              pkg-config
              # ncurses
              # Other dependencies
            ]
          );
        profile = "export FHS=1";
        # runScript = "fish";
        extraOutputsToInstall = ["dev"];
      });
in {
  home.packages = with pkgs; [
    # steam-run-free
    general-fhs-env
  ];
}
