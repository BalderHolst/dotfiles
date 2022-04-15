import datetime
import json
import os
import subprocess

os.system("source ~/.bash_aliases")

def load_apps():
    with open('checks.json','r') as f:
        return(json.load(f))



apps = load_apps()

date = currentDate = datetime.date.today()
day = int(currentDate.strftime("%j"))


for app in apps:
    print(app['last_checked'] + app['frequency'])
    print("\n")
    if (app['last_checked'] + app['frequency'] >= day):
        cmd = app['cmd'].replace('%d',str(date))


        subprocess.run(["notify-send","Autoscript",f"Autoscript Running \"{app['name']}\""])

        os.system(f"{cmd} || notify-send Autoscript \"{app['name']} failed to run\"")



