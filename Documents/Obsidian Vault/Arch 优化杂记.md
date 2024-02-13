## 关闭CPU漏洞环境措施以提高性能

添加内核参数：`mitigations=off`

## 使用TLP延长待机时间

安装软件包：`tlp` `tlp-rdw`

## 硬件视频加速

`yay -S libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau`
对于vdpau硬解，amdgpu要添加环境变量：`VDPAU_DRIVER=radeonsi`

## 关闭看门狗

用`journalctl -b -1|grep watchdog`找出看门狗名称，然后添加内核参数：`nowatchdog` `modprobe.blacklist=wdat_wdt`
AMD Ryzen CPU需要额外禁用`sp5100_tco`
## 微码

参见 [Arch Wiki](https://wiki.archlinuxcn.org/wiki/AMD_Ryzen)

## 音频静音 LED
参见 [Arch Wiki](https://wiki.archlinuxcn.org/wiki/%E7%AC%94%E8%AE%B0%E6%9C%AC%E7%94%B5%E8%84%91#%E9%9F%B3%E9%A2%91%E9%9D%99%E9%9F%B3_LED)

## 自动登录和自动NumLock on
```
# /etc/systemd/system/getty@tty1.service.d/autologin.conf

[Service]
ExecStart=
ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin username %I $TERM
```

```
# /etc/systemd/system/getty@.service.d/activate-numlock.conf

[Service]
ExecStartPre=/bin/sh -c 'setleds -D +num < /dev/%I'
```

## GameMode
将自己添加到gamemode组：
`sudo usermod -aG gamemode $USER`