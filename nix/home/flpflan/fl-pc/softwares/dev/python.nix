{pkgs, ...}: {
  # programs.uv.enable = true;

  home.packages = with pkgs; [
    uv
    (python3Minimal.withPackages
      (p:
        with p; [
          # debugpy
        ]))
  ];
}
