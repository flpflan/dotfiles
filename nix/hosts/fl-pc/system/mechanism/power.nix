{ lib, ... }:
{
  powerManagement = {
    enable = true;
    cpuFreqGovernor = lib.mkDefault "ondemand";
  };

  services.thermald.enable = true;

  #NOTE: Auto-cpufreq is good for laptop
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "auto";
        platform_profile = "balanced";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
        platform_profile = "balanced";
      };
      # BC mode
      # enable_thresholds = true;
      # start_threshold = 20;
      # stop_threshold = 80;
    };
  };

  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
    # extraArgs = [ "--performance" "--autopower" ];
  };

  services.upower.enable = true;
}
