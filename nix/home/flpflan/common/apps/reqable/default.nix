{ pkgs, ... }:

{
  security.pki.certificates = [
    (builtins.readFile ./reqable-ca.pem)
  ];

  home.packages = with pkgs; [
    reqable
  ];
}
