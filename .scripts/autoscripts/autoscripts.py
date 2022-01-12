#type: f

import datetime
import json
import os
import subprocess

os.system("source ~/.bash_aliases")

path = '/home/Balder/.scripts/autoscripts/apps.json'


def load_apps():
    with open(path, 'r') as f:
        return(json.load(f))


def save_apps(d):
    with open(path, 'w') as f:
        return(json.dump(d, f, indent=4))



apps = load_apps()

date = currentDate = datetime.date.today()
day = int(currentDate.strftime("%j"))


for i,app in enumerate(apps):
    if (app['last_checked'] + app['frequency'] >= day):
        cmd = app['cmd'].replace('%d', str(date))

        subprocess.run(["notify-send", "Autoscript", f"Autoscript Running \"{app['name']}\""])

        ex = os.system(f"{cmd}")
        if (ex != 0):
            os.system(f"notify-send Autoscript \"{app['name']} failed to run\"")
       
            app['last_checked'] = day


if (apps != load_apps()):
    #print(apps,load_apps())
    save_apps(apps)
else:
    os.system("notify-send Autoscript 'no autoscripts to run'")

