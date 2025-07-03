{ pkgs, thb-proxy, ... }:

let
  pyEnv = pkgs.python3.withPackages (ps: with ps; [
    uvicorn uvicorn.optional-dependencies.standard fastapi
  ]);

  port = "7777";
in 
{
  systemd.user.services.thb-proxy = {
    enable = true;
    description = "THB-PROXY";
    after = [ "network.target" ];
    wants = [ "network.target" ];
    path = [ pyEnv ];
    serviceConfig = {
      User = "apps";
      WorkingDirectory = "${thb-proxy}";
      ExecStartPre = '''';
      ExecStart = ''uvicorn main:app --port ${port} --workers 2'';
      Restart = "on-abnormal";
      RestartSec = "5s";
      KillMode = "mixed";
      StandardOutput = "journal";
      StandardError = "journal";
    };
    wantedBy = [ "multi-user.target" ];
  };

  services.nginx.upstreams."thb-proxy".servers = {
    "127.0.0.1:${port}" = { };
    "info.thbattle.net" = { backup = true; };
  };

  services.nginx.virtualHosts."proxy.flpflan.moe" = {
    listen = [
      {
        addr = "0.0.0.0";
        port = 80;
      }
      {
        addr = "[::]";
        port = 80;
      }
    ];
    locations."/game" = {
      extraConfig = ''
        rewrite ^/game(/.*)$ $1 break;
        proxy_pass http://thb-proxy;
        client_max_body_size 100m;
        proxy_redirect http://$host/ http://$host/game/;
        proxy_set_header HOST $host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      '';
    };
  };
}

