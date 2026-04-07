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
        (graalvmPackages.buildGraalvm {
          src = fetchurl {
            sha256 = "sha256-sEgGmqo6mbhPW5V7FizBgaMqQzDLw1QCdmNjxb52rkg=";
            url = "https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-21.0.2/graalvm-community-jdk-21.0.2_linux-x64_bin.tar.gz";
          };
          version = "21.0.2";
        })
        # javaPackages.compiler.temurin-bin.jre-17
        # zulu21
        zulu17
      ];
    })
  ];

  xdg.dataFile."PrismLauncher/catpacks/猫羽雫.png".source = outOfStore "${fl-dots}/assets/猫羽雫.png";
}
