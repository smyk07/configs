#!/usr/bin/python3

import sys
import shutil
import subprocess

if sys.argv[1] == "dual":
    shutil.copy("/home/clix/.config/i3/dual_config", "/home/clix/.config/i3/config")
elif sys.argv[1] == "single":
    shutil.copy("/home/clix/.config/i3/single_config", "/home/clix/.config/i3/config")
else:
    pass

subprocess.run("i3 restart", shell=True, executable="/bin/zsh")

print("Successful")
