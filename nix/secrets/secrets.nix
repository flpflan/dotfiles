let
  keys = import ./keys.nix;
  inherit (keys) hosts users;
in
{
 # fl-pc
 "hosts/fl-pc/mihomo.yaml.age".publicKeys = hosts.fl-pc ++ users.flpflan;
 "hosts/fl-pc/ssh_host_ed25519_key.age".publicKeys = hosts.fl-pc ++ users.flpflan;
 "hosts/fl-pc/ssh_host_ed25519_key.pub.age".publicKeys = keys.all;

 # fl-vps
 "hosts/fl-vps/ssh_host_ed25519_key.age".publicKeys = hosts.fl-vps ++ users.flpflan;
 "hosts/fl-vps/ssh_host_ed25519_key.pub.age".publicKeys = keys.all;
 "hosts/fl-vps/sb.json.age".publicKeys = hosts.fl-vps ++ users.flpflan;

  # User - flpflan
  "users/flpflan/passwd.age".publicKeys = keys.all;
  # "users/flpflan/id_ed25519.age".publicKeys = users.flpflan;
  # "users/flpflan/id_ed25519.pub.age".publicKeys = keys.all;
  # "users/flpflan/id_rsa.age".publicKeys = users.flpflan;
  # "users/flpflan/id_rsa.pub.age".publicKeys = keys.all;
  # "users/flpflan/ssh_config.age".publicKeys = keys.all;
}
