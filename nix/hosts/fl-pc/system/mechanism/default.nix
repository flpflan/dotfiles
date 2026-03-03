{ tools, ... }:

{
  imports = tools.scan ./.;

  #TODO:
  zramSwap.enable = true;

  boot.tmp = {
    useTmpfs = true;
    # cleanOnBoot = true; # expired after 10 days by default.
  };

  # TODO: Temporarily disable this for faster building.
  # systemd.services.nix-daemon = {
  #   environment = {
  #     TMPDIR = "/var/tmp"; # expired after 30 days by default.
  #   };
  # };
  # environment.variables.NIX_REMOTE = "daemon"; # See: https://lantian.pub/article/modify-computer/nixos-impermanence.lantian/
}
