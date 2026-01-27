{
  config,
  specialArgs,
  tools,
  ...
}: let
  inherit (tools) relative;
  inherit (config.networking) hostName;
in {
  # TODO: Move to host scope
  imports = [
    (relative "<home-manager>")
  ];
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = specialArgs;
  home-manager.backupFileExtension = "hm-bak"; # Backup existing files rather than exiting with an error
  home-manager.users.flpflan = relative "home/flpflan/${hostName}";
}
