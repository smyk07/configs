#!/usr/bin/python3

import sys
import shutil
import subprocess

if sys.argv[1] == "dualh":
    shutil.copy(
        "/home/clix/.config/i3/dual_horizontal_config", "/home/clix/.config/i3/config"
    )
elif sys.argv[1] == "dualv":
    shutil.copy(
        "/home/clix/.config/i3/dual_vertical_config", "/home/clix/.config/i3/config"
    )
elif sys.argv[1] == "single":
    shutil.copy("/home/clix/.config/i3/single_config", "/home/clix/.config/i3/config")
else:
    pass

subprocess.run("i3 restart", shell=True, executable="/bin/zsh")

print("Successful")
