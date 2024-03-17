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

## 备份盘

建议用 rsync, 连同文件权限及修改时间一起备份(路径最后的 **/** 不能省略，有无 **/** 对 rsync 来说是不同的路径)
`rsync -avrh --progress /mnt/to/ /from/`

## BBR算法

谷歌开发的BBR 拥塞控制算法，可以实现更高的带宽和更低的延迟，想要优化网速，可以尝试开启这个功能，首先加载内核模块 `tcp_bbr`，`sudo modprobe tcp_bbr`，之后编辑 `/etc/sysctl.d/30-bbr.conf`：

```
net.core.default_qdisc = cake
net.ipv4.tcp_congestion_control = bbr
```

之后重启，应该就能生效了。

## ALHP

ALHP 软件源将 Arch Linux 官方源中的软件包进行了重新编译，使用了 `x86-64-v2` 和 `x86-64-v3` 优化，可以提升一部分性能。

添加这个软件源之前，需要先确认当前机器是否支持 `x86-64-v2` 和 `x86-64-v3`，运行 `/lib/ld-linux-x86-64.so.2 --help`，若输出中有：

```
Subdirectories of glibc-hwcaps directories, in priority order:
  x86-64-v4
  x86-64-v3 (supported, searched)
  x86-64-v2 (supported, searched)
```

说明机器支持 `x86-64-v2` 和 `x86-64-v3`。

之后从 AUR 安装 `alhp-keyring` 和 `alhp-mirrorlist`，之后编辑 `/etc/pacman.d/alhp-mirrorlist` 镜像列表，alhp 在国内有上海科技大学镜像站一个镜像源，这个镜像源速度不太稳定，不过也比其他国外镜像快许多，推荐将这个镜像源放在首位。之后编辑 `/etc/pacman.conf`，添加：

```
[core-x86-64-v3]
Include = /etc/pacman.d/alhp-mirrorlist

[extra-x86-64-v3]
Include = /etc/pacman.d/alhp-mirrorlist

[multilib-x86-64-v3]
Include = /etc/pacman.d/alhp-mirrorlist
```

若系统只支持 `x86-64-v2`，需要将 `x86-64-v3` 改成 `x86-64-v2`，另外一定要添加在官方的 `[core]`、`[extra]` 和 `mutilib` 之前，保证软件包优先于官方包安装。

之后运行 `sudo pacman -Suy`，这会安装很多软件包，需要较长时间，完成后重启。添加了这个软件源后，跑了下分没有明显变化，但是在游戏中帧率好像高了些，还稳定了些，有点玄学，提升聊胜于无吧。

若遇到了问题，想要禁用这个软件源，只需删除 `/etc/pacman.conf` 中对应的内容，卸载 `alhp-keyring` 和 `alhp-mirrorlist`，之后运行 `sudo pacman -Suuy`，就可以将所有软件包恢复到官方了。

## 时间同步

systemd 自带了一个 systemd-timesyncd 服务，提供了简单的时间同步服务，若是没有特别需求，这个服务已经够用了。不过这个服务默认使用的是 Arch Linux 自己的 NTP 服务器，在国内访问较慢，有时会导致时间同步失败，为了更快地同步时间，可以选用其他的 NTP 服务器，我选用了中国 NTP 快速授时服务和中国计量科学研究院 NIM 授时服务的 NTP 服务器，编辑 `/etc/systemd/timesyncd.conf`，添加或编辑如下一行：

```
NTP=cn.ntp.org.cn ntp1.nim.ac.cn
```

然后重启 systemd-timesyncd.service，之后运行 `timedatectl timesync-status` 便可查看时间同步状态：

```
$ timedatectl timesync-status
       Server: 2001:da8:9000::130 (cn.ntp.org.cn)
Poll interval: 34min 8s (min: 32s; max 34m$ timedatectl timesync-status
       Server: 2001:da8:9000::130 (cn.ntp.org.cn)
Poll interval: 34min 8s (min: 32s; max 34min 8s)
         Leap: normal
      Version: 4
      Stratum: 1
    Reference: PTP
    Precision: 1us (-26)
Root distance: 45us (max: 5s)
       Offset: -2.957ms
        Delay: 31.415ms
       Jitter: 4.354ms
 Packet count: 18
    Frequency: -4.740ppmin 8s)
         Leap: normal
      Version: 4
      Stratum: 1
    Reference: PTP
    Precision: 1us (-26)
Root distance: 45us (max: 5s)
       Offset: -2.957ms
        Delay: 31.415ms
       Jitter: 4.354ms
 Packet count: 18
    Frequency: -4.740ppm
```

可以看到这里 offset 只有不到 3 毫秒，还是很精准的。

## Clash TUN 模式
新版的 Clash Premium 内核支持 TUN 模式，且目前已支持 Linux 系统下的 auto-route 和 auto-detect-interface，无需手动设置转发表，可以方便快捷的实现 透明网关（旁路由） 的功能。

首先需要下载 Clash Premium 版本：

```
yay -S clash-premium-bin
```

接着需要设置 Linux 系统，开启转发功能。编辑文件 `/etc/sysctl.conf`，添加以下内容：

```
net.ipv4.ip_forward=1
```

保存退出后，执行以下命令使修改生效：

```
sudo sysctl -p
```

然后接着需要关闭系统的 DNS 服务，使用以下命令：

```
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
```

**关于代理环境下 DNS 解析行为的深入探讨，可以参见[浅谈在代理环境中的 DNS 解析行为](https://blog.skk.moe/post/what-happend-to-dns-in-proxy/)以及[我有特别的 DNS 配置和使用技巧](https://blog.skk.moe/post/i-have-my-unique-dns-setup/)。**

接着需要设置 Clash 的配置文件，添加以下内容：

```
dns:
  enable: true
  listen: 0.0.0.0:53
  enhanced-mode: fake-ip
  nameserver:
    - 114.114.114.114
  fallback:
    - 8.8.8.8
tun:
  enable: true
  stack: system # or gvisor
  dns-hijack:
    - 8.8.8.8:53
    - tcp://8.8.8.8:53
    - any:53
    - tcp://any:53
  auto-route: true # auto set global route
  auto-detect-interface: true # conflict with interface-name
```

最后重启 Clash 服务即可，这样流量就会通过 TUN 接口转发，同时利用强大的分流规则，实现按需代理。也可以设置局域网内的网关地址和 DNS 服务器地址，实现透明网关。

## 在 Chrome 浏览器(Wayland Mode)中使用 Fcitx5

添加 `--enable-wayland-ime` 启动参数

# 使用 Photoshop

[参考这个](https://forum.mattkc.com/viewtopic.php?t=336) [还有这个](https://appdb.winehq.org/objectManager.php?sClass=version&iId=41345)