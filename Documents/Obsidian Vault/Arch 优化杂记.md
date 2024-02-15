## 关闭CPU漏洞环境措施以提高性能

添加内核参数：`mitigations=off`

## 使用TLP延长待机时间

安装软件包：`tlp` `tlp-rdw` `ethtool` `smartmontools`

启用 `NetworkManager-dispatcher.service`

屏蔽 systemd 服务`systemd-rfkill.service` 以及套接字 `systemd-rfkill.socket`

```
systemctl mask systemd-rfkill.service systemd-rfkill.socket
```

配置文件位于`/etc/tlp.conf`, 可能需要手动改一下配置（如`DISK_DEVICES`）
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

将自己添加到gamemode组：`sudo usermod -aG gamemode $USER`

## Wine

黑屏的话，可以尝试用`--disable-gpu`启动参数禁用GPU加速

## SSD TRIM

安装 `util-linux` 包，然后 `systemctl enable fstrim.timer` 启用定时 TRIM

## SSD 调度器

`cat /sys/block/nvme0n1/queue/scheduler`(nvme0n1为对应盘符)查看当前调度器，固态盘用kyber就好

## Ext4 禁用屏障

文件系统中添加`barrier=0`选项（非笔记本不建议启用）

通过`cat /proc/mounts`，如果有出现barrier=1说明启用了barrier