{ config, ... }:

{
  networking.firewall.allowedTCPPorts = [ 443 80 ];

  services.nginx = {
    enable = true;

    enableReload = true;

    recommendedGzipSettings = true;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;

    commonHttpConfig = "access_log syslog:server=unix:/dev/log;";

    resolver.addresses =
      let
        isIPv6 = addr: builtins.match ".*:.*:.*" addr != null;
        escapeIPv6 = addr: if isIPv6 addr then "[${addr}]" else addr;
        cloudflare = [
          "1.1.1.1"
          "2606:4700:4700::1111"
        ];
        resolvers =
          if config.networking.nameservers == [ ] then cloudflare else config.networking.nameservers;
      in
      map escapeIPv6 resolvers;

    sslDhparam = config.security.dhparams.params.nginx.path;
  };

  security.dhparams = {
    enable = true;
    params.nginx = { };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "flpflan@gmail.com";
  };
  security.acme.certs = {
    # "blog.flpflan.moe".email = "flpflan@gmail.com";
  };
}
