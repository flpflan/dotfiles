let
  inherit (builtins) concatLists attrValues;

  users = {
    flpflan = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPFD748yH4JB/SV7EHZlNIYQ0TITiQEjj1ez6ybSPMHq"
    ];
  };

  hosts = {
    fl-pc = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIDI/P8X4mMhvShmSQUeSx8UxvCGwHNeiJAyQiW/6kfW"
    ];
    opiz3 = [];
    fl-vps = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL648cWiSuMKpjChNwHWy8IhBhvX86gYA+uZngE3lG2f"
    ];
  };
in
{
  users = users // {
    all = concatLists (attrValues users);
  };

  hosts = hosts // {
    all = concatLists (attrValues hosts);
  };

  all = concatLists (attrValues users) ++ concatLists (attrValues hosts);
}
