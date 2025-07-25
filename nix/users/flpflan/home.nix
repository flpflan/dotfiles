{ pkgs, config, specialArgs, tools, ... }:

let
  inherit (tools) relative;
  inherit (config.age) secrets;
  inherit (config.networking) hostName;
in 
{
  imports = [
    (relative "<home-manager>")
  ];
  users.users.flpflan = {
    isNormalUser = true;
    hashedPasswordFile = secrets."users/flpflan/passwd".path;
    description = "flpflan";
    extraGroups = [ "networkmanager" "wheel" ];
    #openssh.authorizedKeys.keys = [
    #  "ssh-ed25519 <> flpflan@fl-pc"
    #];
    # home = "/home/flpflan";
    shell = pkgs.fish;
  };
	home-manager.useUserPackages = true;
	home-manager.extraSpecialArgs = specialArgs;
	home-manager.backupFileExtension = "hm-bak"; # Backup existing files rather than exiting with an error
	home-manager.users.flpflan = relative "home/flpflan/${hostName}";
}
