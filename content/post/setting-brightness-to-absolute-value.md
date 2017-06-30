+++
title = "Setting Brightness To Absolute Value"
date = 2017-06-30T17:25:54+05:30
slug = ""
tags = ["linux"]
categories = ["hacks"]
draft = false
+++

Like me most you have habit to "rage into the dark night" with backlit keyboards, f.lux or redshift and what-nots.
I find the lowest brightness of the display, attained by pressing the **F11** key, to be brighter than my taste.

So I checked if  it's possible to set the brightness level to some value since **everything in unix 
is a file**. 

Ofcourse it is, lemme show you...

```
/sys/class/backlight/intel_backlight

# Mine is from intel, your's might be different 
# Interestingly it’s a symbolic link to -> 
# /sys/devices/pci../..:02.0/drm/card0/card0-eDP-1/intel_backlight/
```

It contains the the values related to the current display.
    
- `actual_brightness` and `brightness` shows the current brightness level.
- `max_brightness` gives the maximum brightness value that the display can produce(dunno if I can override that).


Now to change the brightness to absolute value you need to have **root access**.

```
$ sudo su root
# echo 10 > /sys/class/backlight/intel_backlight/brightness
```
This will set the brightness level to **10**. **0** means no back-light and **1** is the minimum brightness value (sorry, no decimals).


Read More [here](https://wiki.archlinux.org/index.php/Backlight).
