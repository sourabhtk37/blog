+++
title = "Connect bluetooth speaker from console"
date = 2017-09-27T15:45:43+05:30
slug = ""
tags = []
categories = ["linux"]
draft = false
+++

Being a heavy console user I would like to have the ability to control everything right from the vincity of the 80*25px window to the world.
This post is one such attempts to share whatever things I find and share the configurations with others trying to find the solution for the same.

Now I have an old bluetooth speaker that I want to use to listen to some light music in the background.

### Problem
Connecting to bluetooth audio device and streaming audio.

### Solution

Simple. Two things do:

- Connect to bluetooth audio device
- Stream audio to it

#### Connect to bluetooth audio device

I am using **bluetoothctl** which lets you access Bluetooth controller of your device. Open it up on terminal, you will get a clean [repl](https://en.wikipedia.org/wiki/Read-eval-print_loop) like this:

```
[bluetooth]#
```

Now, tell the bluetooth controller to start scanning for bluetooth devices:

```
[bluetooth]# scan on
Discovery started
[CHG] Controller xx:xx:xx:xx:xx:xx Discovering: yes
```

Check the result of the scan using:

```
[bluetooth]# devices
Device yy:yy:yy:yy:yy:yy Some cheap ass BT speaker
```

Pair it up and connect to the device using the MAC address(looks like this -> yy:yy:yy:yy:yy:yy):

```
[bluetooth]# pair yy:yy:yy:yy:yy:yy

[bluetooth]# connect yy:yy:yy:yy:yy:yy
```

This will establish a connection with the BT audio device. Now we need to move audio stream to the BT device.


#### Stream audio to it

The speaker needs an audio stream from the device. One simply have to set audio sink to the speaker from the available stream and we are done.

To make sure device allows A2DP audio sink, edit `/etc/bluetooth/input.conf`. Add under `[General]` the following :

```
Enable=Source,Sink,Media,Socket
```

Alternatively, you can be more specific by telling which audio stream to play on the audio device. This is done by **pactl** which is a tool to control a running pulseaudio server. There are two things:

- **Sinks** are the destination for sending media (if audio sink, then pipeline for sending audio), analogous to a kitchen sink.
- **Sink-inputs** are the source of the media or the application that is serving the audio stream. 

To list the available sinks available :

```
$ pactl list short sinks
0       alsa_output.xxx.analog-stereo      module-alsa-card.c      a12lw 2ch 44100Hz       SUSPENDED
1       bluez_sink.xxxx.a2dp_sink  module-bluez5-device.c  a12lw  2ch 44100Hz       RUNNING
```

The id of `alsa_output` is **0** and `bluez_sink`(bluetooth audio device) is **1**. 

and to list the available sink-inputs :

```
$ pactl list short sink-inputs
0       1       4       protocol-native.c       a12lw 2ch 44100Hz
```
The audio stream have the id **0**.

Now, we will tell the pulseaudio server to move sink input to the bluetooth using ids we found above, you can also use the complete name too :

```
// pactl move-sink-input <sink-input> <sink>
$ pactl move-sink-input 0 1
```

You are done.

---
Read more :

- [Archwiki](https://wiki.archlinux.org/index.php/Bluetooth_headset) for connecting bluetooth headset.
- [Archwiki](https://wiki.archlinux.org/index.php/Bluetooth) for bluetooth guide.