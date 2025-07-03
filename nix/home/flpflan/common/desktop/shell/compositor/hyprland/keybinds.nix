{
  bind = [
    "Super, 1, workspace, 1"
    "Super, 2, workspace, 2"
    "Super, 3, workspace, 3"
    "Super, 4, workspace, 4"
    "Super, 5, workspace, 5"
    "Super, 6, workspace, 6"
    "Super, 7, workspace, 7"
    "Super, 8, workspace, 8"
    "Super, 9, workspace, 9"
    "Super, 0, workspace, 0"
    "Super, mouse_up, workspace, +1"
    "Super, mouse_down, workspace, -1"
    "Super, Q, killactive"
    "Super+Shift+Alt, Q, exec, hyprctl kill" # Pick and kill a window
    "Super, W, exec, $webBrowser"
    "Super, T, exec, $TERM"
    "Super, E, exec, $TERM -e yazi"
  ];
  bindm = [
    "Super, mouse:272, movewindow"
    "Super, mouse:273, resizewindow"
  ];
}
