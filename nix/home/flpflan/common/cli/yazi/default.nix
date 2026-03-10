{
  config,
  pkgs,
  fl-dots,
  ...
}:

let
  dots = "${fl-dots}/dots";
  outOfStore = config.lib.file.mkOutOfStoreSymlink;
  # keymap = lib.importTOML "${fl-dots}/yazi/keymap.toml";
  # settings = lib.importTOML "${fl-dots}/yazi/keymap.toml";
  # plugins = with pkgs.yaziPlugins; {
  #   full-border = full-border;
  #   starship = starship;
  #   chmod = chmod;
  #   diff = diff;
  #   git = git;
  #   # mactag = mactag;
  #   mount = mount;
  #   smart-enter = smart-enter;
  #   vcs-files = vcs-files;
  #   lazygit = lazygit;
  # };
  # // (lib.optionalAttrs pkgs.stdenv.isDarwin { mactag = mactag; });
in
{
  home.packages = [ pkgs.yazi ];

  xdg.configFile."yazi" = {
    source = outOfStore "${dots}/yazi";
    recursive = false;
  };

  # xdg.configFile = (lib.mapAttrs' (
  #       name: value: lib.nameValuePair "yazi/plugins/${name}.yazi" { source = value; }
  #     ) cfg.plugins);

  xdg.desktopEntries."yazi-gui" = {
    name = "Yazi-GUI";
    icon = "yazi";
    comment = "Blazing fast terminal file manager written in Rust, based on async I/O";
    terminal = false;
    exec = "foot -a yazi -T yazi ${fl-dots}/snippets/wrap_term_launch yazi %u";
    type = "Application";
    mimeType = [ "inode/directory" ];
    categories = [
      "Utility"
      "Core"
      "System"
      "FileTools"
      "FileManager"
    ];
  };
}
