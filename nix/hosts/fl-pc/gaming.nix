{
  # programs.steam = {
  #   enable = true;
  #   gamescopeSession.enable = true;
  # };
  #
  programs.gamemode.enable = true;

  # For vibration in wireless mode
  # 此外，这可以使能承影P5手柄的飞鼠模式
  hardware.xpadneo.enable = true;

  # This is not necessary; only used to access the controller's battery level.
  # Or use this to avoid adding user to `input` group in cable mode.
  hardware.steam-hardware.enable = true;

  users.users.flpflan.extraGroups = [ "input" ];
}
