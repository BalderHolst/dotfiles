import os
import re
import shutil

vault_path = "/home/Balder/Documents/uni/noter"
gym_folder = f"{vault_path}/Gym"

taged_files = {}
untaged = []

for file_name in os.listdir(gym_folder):
    file_path = f"{gym_folder}/{file_name}"
    if os.path.isdir(file_path):
        continue

    # print(file_path)

    with open(file_path, 'r') as f:
        lines = f.readlines()
    
    # flag that is true if the note has a tag
    tagged = False

    for line in lines:
        m = re.search("#\w+ ", line)
        if m:
            tagged = True
            tag = m.group().replace(" ", "")

            if tag not in taged_files:
                taged_files[tag] = [file_path]
            else:
                taged_files[tag].append(file_path)
    if not tagged:
        untaged.append(file_path)

# move fysik og matematik til main folder

# print(taged_files.keys())

# For moving all files with a tag
# ===============================
# for file_path in taged_files["#matematik"]:
#     file_name = file_path.split("/")[-1]
#     dst = f"{vault_path}/{file_name}"
#     print(f"moving {file_path!r} to {dst!r}.")
#     shutil.move(file_path,dst)


for n, file in enumerate(untaged):
    file_name = file.split("/")[-1]

    print(input(f"({n+1}/{len(untaged)}) File: {file_name!r}. Tag: "))
