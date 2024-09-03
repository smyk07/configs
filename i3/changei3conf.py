#!/usr/bin/python3

import subprocess

with open("/home/clix/.config/i3/config", "r") as config:
    data = config.readlines()

if data[111] == "set $fm HDMI-1\n":
    data[111] = "set $fm eDP-1\n"
    data[112] = "set $sm HDMI-1\n"
else:
    data[111] = "set $fm HDMI-1\n"
    data[112] = "set $sm eDP-1\n"

with open("/home/clix/.config/i3/config", "w") as config:
    config.writelines(data)

subprocess.run("i3 restart", shell=True, executable="/bin/zsh")

print("\nsuccessful: ")
print(data[111][:-1])
print(data[112][:-1])
