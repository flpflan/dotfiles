{lib, ...}: {
  nix = {
    daemonCPUSchedPolicy = "idle";
    daemonIOSchedClass = lib.mkForce "idle";
    daemonIOSchedPriority = lib.mkForce 7;
  };

  programs.bash.bashrcExtra = ''
    cargo() {
        local cargo_path
        cargo_path=$(command -v cargo)
        nice -n 5 ionice -c2 -n7 "$cargo_path" "$@"
    }
  '';
}
