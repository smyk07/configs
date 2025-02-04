#!/usr/bin/python3

import sys
import shutil
import subprocess

configs = {
    "dualh": "dual_horizontal_config",
    "dualv": "dual_vertical_config",
    "single": "single_config",
}


def change_config(arg: str):
    shutil.copy(f"/home/clix/.config/i3/{configs[arg]}", "/home/clix/.config/i3/config")


change_config(sys.argv[1])


subprocess.run(
    "i3 restart",
    shell=True,
    executable="/bin/zsh",
    stdout=subprocess.DEVNULL,
    stderr=subprocess.STDOUT,
)
