+++
title = "Brightness, volume control and other stuff in I3"
date = 2017-08-01T00:59:58+05:30
slug = ""
tags = []
categories = ["linux"]
draft = false
+++

I have recently started using [i3wm](https://i3wm.org/) on a full-time basis. Previously, I have been using KDE plasma (checkout [KDE connect](https://community.kde.org/KDEConnect) if using KDE plasma). 

This post is simply to share some of the common configs that one might need to add after booting into i3 for the first time. The settings for i3 configs are mostly found at `~/.config/i3/config`, if not copy from `/etc/i3/config`.

##### Meta Key
I am using windows or host as **Meta key**. To do that simply set the required key to the `$mod` variable. In my case:

```
set $mod Mod4
```

##### Terminal
Default terminal is set to **i3-sensible-terminal** which is not sensible at all. I prefer **konsole** terminal from KDE. To change it:

```
bindsym $mod+return exec /usr/bin/konsole
```

Alternatively, you could also set the `$TERMINAL` variable.

##### Bar
I prefer the bar to be on top of screen. You can simply change that by doing*:

```
bar {
	position top
	status_command i3status
}
```

*create this block if doesn't exist else edit existing block, unless you want to bars. 

##### Volume Control
Volume keys doesn't  working in most cases. To identify the keycode of the volume button on your keyboard, use the **xev** command to get the *content of X events*. Use:

```
xev -event keyboard
```

Upon pressing the volume keys, we will get the keycodes. They are:

- XF86AudioRaiseVolume
- XF86AudioLowerVolume
- XF86AudioMute

I am using **amixer** to change the volume. The configuration looks like this:

```
bindsym XF86AudioRaiseVolume exec amixer -q set Master 5%+ unmute
bindsym XF86AudioLowerVolume exec amixer -q set Master 5%- unmute
bindsym XF86AudioMute exec amixer -q set Master toggle
```

##### Brightness Control
Use **xev** again for finding the button keycodes for brightness control. Now check whether **xbacklight** is able to detect the drivers. If yes, then simply add the following to the i3 config file:

```
bindsym XF86MonBrightnessUp exec xbacklight -inc 20
bindsym XF86MonBrightnessDown exec xbacklight -dec 20
```

If not and you get something like **"No outputs have backlight property"**, then follow the instructions:

- Find out the drivers for backlight that is present in your system with:

```
sudo find /sys/ -type f -iname 'brightness'
```

This will give you a hint to the drivers you have. Mine was an **intel_backlight**(others can be **acpi_video0**) with symlink to `/sys/class/backlight/intel_backlight/brightness`. 

- Change file mod bits so that it can be writable. For that do: 

```
sudo chmod a+rw /sys/class/backlight/intel_backlight/brightness
```

- Next, create a shell script with the content as following:

```
#!/bin/bash

set -e
file="/sys/class/backlight/intel_backlight/brightness"
current=$(cat "$file")
new="$current"

if [ "$1" = "-inc" ]
then
	new=$(( current + $2 ))
fi

if [ "$1" = "-dec" ]
then
    new=$(( current - $2 ))
fi

echo "$new" | tee "$file"
```
- Then simply add the following to i3 config file:

```
bindsym XF86MonBrightnessUp exec sh ~/.config/i3/backlight.sh -inc 20
bindsym XF86MonBrightnessDown exec sh ~/.config/i3/backlight.sh -dec 20
```

`~/.config/i3/backlight.sh` is path to the shell script shown earlier in my case.

##### Application shortcuts
You can set shortcuts for frequently used applications by doing something like:
```
bindsym $mod+c exec google-chrome
bindsym $mod+g exec geary
```
So, **Meta+c** will open Google Chrome and **Meta+g** will open Geary.

##### Shutdown, reboot, logout etc

The following sets **Meta+Escape** to give you a menu to select whether to lock, logout, suspend, hibernate, reboot, shutdown:

```
set $Locker i3lock && sleep 1

set $mode_system (l)lock  (e)logout  (s)suspend  (h)hibernate  (r)reboot  (Shift+s)shutdown
 
mode "$mode_system" {
	bindsym l exec --no-startup-id $Locker, mode "default"
	bindsym e exec --no-startup-id i3-msg exit, mode "default"
	bindsym s exec --no-startup-id $Locker && systemctl suspend, mode "default"
	bindsym h exec --no-startup-id $Locker && systemctl hibernate, mode "default"
	bindsym r exec --no-startup-id systemctl reboot, mode "default"
	bindsym Shift+s exec --no-startup-id systemctl poweroff -i, mode "default"

	# back to normal: Enter or Escape
	bindsym Return mode "default"
	bindsym Escape mode "default"
}

bindsym $mod+Escape mode "$mode_system"
```

##### Bonus: Xrandr
Check the connected display names and their settings using command `xrandr --query`.

In my case, they are **eDP-1** for the laptop display and **HDMI-1** or **VGA-1** for external respectively.

Upon connecting external display you can use the following configurations:

```
set $mode_display Ext Screen (v) VGA ON, (h) HDMI ON, (x) VGA OFF, (y) HDMI OFF

mode "$mode_display" {
    bindsym v exec --no-startup-id xrandr --output VGA-1 --auto --right-of eDP-1, mode "default"
    bindsym h exec --no-startup-id xrandr --output HDMI-1 --auto --right-of eDP-1, mode "default"
    bindsym x exec --no-startup-id xrandr --output VGA-1 --auto --off, mode "default"
    bindsym y exec --no-startup-id xrandr --output HDMI-1 --auto --off, mode "default"

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}

bindsym $mod+x mode "$mode_display"
```

You can change whether you want the display on left or right or same as that of **eDP-1** depending on what your usecase is.

---

###### Resources:

- The [i3 docs](https://i3wm.org/docs/userguide.html) are very informative and clear.
- [Arch wiki of i3](https://wiki.archlinux.org/index.php/I3) is where I got some of the scripts.