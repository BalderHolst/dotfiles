# type: n

import json

import sys
import os

working_dir = os.getcwd()
home_dir = "/".join(sys.argv[0].split('/')[0:-1]) 

files = {}

def load_structure(name):
    structures = []
    with open(home_dir + "/structures.json", 'r') as f:
        structures = json.load(f)

    for structure in structures:
        if (name == structure['name']):
            return(structure)

    raise Exception(f"No structure with the name {name}. Valid structures: {[s['name'] for s in structures]}")

def load_packages():
    with open(home_dir + "/packages.json", 'r') as f:
        return(json.load(f))


def create_structure(name):
    structure = load_structure(name)

    for folder in structure['folders']:
        os.system(f"mkdir {working_dir}/{folder}")

    for file in structure['files']:
        files[file.split('/')[-1]] = file
        os.system(f"touch {working_dir}/{file}")

    for link in structure['links']:
        link = link.replace('%w', working_dir).replace('%h',home_dir)
        os.system(link)
        link_location = link.split(' ')[-1].replace(working_dir + "/", '')
        print(link_location)
        files[link_location.split('/')[-1]] = link_location

    # make dotfile for navigation
    with open(f"{working_dir}/.structure.json", 'w') as f:
        json.dump(structure, f, indent = 4)



def write_lines(path, lines):
    with open(path, 'w') as f:
        f.writelines(lines)

def populate(packages):
    main_wrapper = {
            "start": [
                "\\input{" + files["setup.tex"] + "}\n",
                "\\input{" + files["macros.tex"] + "}\n",
                "\n",
                "\\begin{document}\n",
                "\n"
                ],
            "end": [
                "\\chapter{Packages}\n",
                "\n\n".join(packages),
                "\n"
                "\\end{document}\n"
                ]
            }

    all_packages = load_packages()

    setup_lines = []
    main_lines = []

    main_lines.extend(main_wrapper['start'])

    print("\nadding packages:")

    for package in all_packages:
        if package['name'] in packages:

            print('\t' + package['name'])
            if 'setup' in package:
                setup_lines.append(f"% ---------- {package['name']} ----------\n")
                cmds = ['\\' + cmd + '\n' for cmd in package['setup']['cmds']]
                setup_lines.extend(cmds)
                setup_lines.append("\n")

            if 'main' in package:
                cmds = ['\\' + cmd + '\n' for cmd in package['main']['cmds']]
                main_lines.extend(cmds)

    main_lines.extend(main_wrapper['end'])

    write_lines(files['setup.tex'],setup_lines)
    write_lines(files['main.tex'],main_lines)

def init(structure, template):
    create_structure(structure)
    
    packages = []

    try:
        with open(f"{home_dir}/templates/{template}.txt", 'r') as f:
            packages = f.read().split('\n')
    except FileNotFoundError:
        print(f"No template with the name {template}. Valid templates: " + str(os.listdir(home_dir + "/templates")).replace(".txt",''))
        quit(1)

    populate(packages)



if __name__ == "__main__":

    if (len(sys.argv) == 2):
        init("default", sys.argv[1])
    else:
        init(sys.argv[1], sys.argv[2])


