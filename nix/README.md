# fl-nixos-flake

## Structure

*  `home`: Per user Home Manager module.
   * `home/\<username\>/<hostname>`: User specific Home Manager module on specific host.
* `hosts`:Per host modules.
   * `hosts/\<hostname\>/overlays.nix`: Host specific overlays.
   * `hosts/\<hostname\>/secrets.nix`: Host specific secrets implementation.
*  `overlays`: Global overlays.
*  `packages`: Package definitions.
*  `secrets`: Secret stores.
*  `tools`: Programming helpers.
*  `users`: User specific modules.
   * `users/\<username\>/home.nix`: Home Manager module.

## Scope
```
            [flake-wide] --> [host-wide] --> [home-manager-wide]
          |               |               |                     |
home      |               |               |---------------------|
hosts     |               |---------------|---------------------|
overlays  |---------------|---------------|---------------------|
packages  |---------------|---------------|---------------------|
secrets   |---------------|---------------|---------------------|
tools     |---------------|---------------|---------------------|
users     |               |---------------|---------------------|
```
