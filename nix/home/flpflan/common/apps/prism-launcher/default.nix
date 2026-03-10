{
  config,
  pkgs,
  fl-dots,
  ...
}:

let
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
in
{
  # See: https://www.reddit.com/r/feedthebeast/comments/18hta1r/how_i_about_doubled_my_minecraft_performance/
  home.packages = with pkgs; [
    (prismlauncher.override {
      jdks = [
        # javaPackages.compiler.temurin-bin.jre-8 # Adoptium
        graalvmPackages.graalvm-ce # GraalVM
      ];
    })
  ];

  xdg.dataFile."PrismLauncher/catpacks/猫羽雫.png".source = outOfStore "${fl-dots}/assets/猫羽雫.png";
}
