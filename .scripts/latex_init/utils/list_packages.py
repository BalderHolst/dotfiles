import json

ps = []

with open("packages.json", 'r') as f:
    ps = json.load(f)

for p in ps:
    print(p['name'])
