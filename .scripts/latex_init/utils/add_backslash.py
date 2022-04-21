import json

ps = []

with open("packages.json", 'r') as f:
    ps = json.load(f)


for p in ps:
    print(p['name'])
    if "setup" in p:
        for n, cmd in enumerate(p['setup']['cmds']):
            p['setup']['cmds'][n] = "\\" + cmd
    if "main" in p:
        for n, cmd in enumerate(p['main']['cmds']):
            p['main']['cmds'][n] = "\\" + cmd

print(ps[0])

with open("packages.json", 'w') as f:
    json.dump(ps, f, indent = 4)
