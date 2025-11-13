{kdePackages, ...}:
kdePackages.qt6ct.overrideAttrs (oldAttrs: {
  pname = "qt6ct-kde";
  preBuild = ''
    echo "Replacing source files..."
    cp ${./patch/CMakeLists.txt} .
    cp -r ${./patch/src} .
  '';
})
