# 代理
`waydroid shell` 或者 `adb` 执行
```shell
settings put global http_proxy "IP:PORT"
settings put global global_http_proxy_host "IP"
settings put global global_http_proxy_port "PORT"
```
# 卸载
```shell
waydroid session stop
sudo systemctl stop waydroid-container
yay -Rns waydroid
sudo rm -rf /var/lib/waydroid /home/.waydroid ~/waydroid
~/.share/waydroid ~/.local/share/applications/*aydroid* ~/.local/share/waydroid /usr/share/waydroid-extra
```