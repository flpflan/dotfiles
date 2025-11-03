{
  pkgs,
  config,
  ...
}: let
  inherit (config.age) secrets;
in {
  users.users.flpflan = {
    isNormalUser = true;
    hashedPasswordFile = secrets."users/flpflan/passwd".path;
    description = "flpflan";
    extraGroups = ["networkmanager" "wheel"];
    #openssh.authorizedKeys.keys = [
    #  "ssh-ed25519 <> flpflan@fl-pc"
    #];
    # home = "/home/flpflan";
    shell = pkgs.fish;
  };
}
