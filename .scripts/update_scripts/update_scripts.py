#!/bin/python

from pathlib import Path
import re

scripts_dir = Path("~/.scripts").expanduser()
bin_dir = Path("~/.scripts/bin").expanduser()

def remove_contens(d: Path):
    for file in d.iterdir():
        file.unlink()

def link_script(script: Path, bin_dir: Path):
    bin_path = bin_dir / script.stem

    if bin_path.exists():
        print(f"ERROR: '{script}' -> '{bin_path}' already exists")
        return

    print(f"Linking: '{bin_path.name}' -> '{script.name}'")
    bin_path.symlink_to(script)

def link_scripts(d: Path, bin_dir: Path):
    for file in d.iterdir():

        if file == bin_dir:
            continue

        if file.is_file():
            try:
                with file.open() as f:
                    line = f.readline()[:-1]
            except UnicodeDecodeError:
                pass
            if re.match(r"^#!.+", line):
                link_script(file, bin_dir)

        if file.is_dir():
            link_scripts(file, bin_dir)


remove_contens(bin_dir)

link_scripts(scripts_dir, bin_dir)

print("Done!")
