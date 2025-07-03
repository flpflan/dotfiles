{
  hardware.graphics = {
    enable = true;
    # TODO:
    # enable32Bit = true;
    # extraPackages = [];
    # extraPackages32 = [];
  };
  services.xserver.videoDrivers = [ "amdgpu" ];
}
