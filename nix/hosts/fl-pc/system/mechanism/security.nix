{
  security = {
    sudo = {
      wheelNeedsPassword = true;
      execWheelOnly = true;
      extraConfig = ''
        Defaults lecture = never
        Defaults passwd_timeout=0
    '';
    };
    # polkit.enable = true;
  };
}
