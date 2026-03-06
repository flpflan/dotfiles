{
  config,
  specialArgs,
  tools,
  home-manager,
  ...
}:

let
  inherit (tools) relative;
  inherit (config.networking) hostName;
in
{
  # TODO: Move to host scope
  imports = [
    home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = specialArgs;
    backupFileExtension = "hm-bak";
    users.flpflan = relative "home/flpflan/${hostName}";
  };
}
