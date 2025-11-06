{kdePackages, ...}:
kdePackages.qt6ct.overrideAttrs (oldAttrs: {
  postPatch = ''
    echo "Patching source files..."
    cp ${./patch/CMakeLists.txt} .
    cp -r ${./patch/src} .
  '';
})
