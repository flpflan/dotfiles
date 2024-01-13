wallpaper=$(find ~/Pictures/wallpapers|shuf -n 1)
echo \
"preload = $wallpaper
wallpaper = eDP-1, $wallpaper
ipc = off
# splash = true
# splash_offset = 0
" > ~/.config/hypr/hyprpaper.conf
hyprpaper
