// For every option, see ~/.config/ags/modules/.configuration/user_options.js
// (vscode users ctrl+click this: file://./modules/.configuration/user_options.js)
// (vim users: `:vsp` to split window, move cursor to this path, press `gf`. `Ctrl-w` twice to switch between)
//   options listed in this file will override the default ones in the above file

const userConfigOptions = {
  'apps': {
    'imageViewer': 'oculante',
    'network': "foot nmtui",
    "bluetooth": "foot bluetuith",
    "taskManager": "foot -e fish -c htop"
  },
  'appearance': {
    'autoDarkMode': {
      'enabled': false,
      'from': "18:10",
      'to': "6:10",
    }
  },
  'search': {
    'excludedSites': [],
  },
  'weather': {
    'city': "Hebei"
  },
  'dock': {
    'enabled': false,
    'pinnedApps': ['google-chrome-stable, neovide']
  },
  'bar': {
    'modes': ["normal"]
  }
}

export default userConfigOptions;
