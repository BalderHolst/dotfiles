import datetime
import json
import os
import subprocess

os.system("source ~/.bash_aliases")

def load_apps():
    with open('apps.json','r') as f:
        return(json.load(f))


def save_apps(d):
    with open('apps.json','w') as f:
        return(json.dump(d,f))



apps = load_apps()
prev_apps = apps.copy()

date = currentDate = datetime.date.today()
day = int(currentDate.strftime("%j"))


for i,app in enumerate(apps):
    if (app['last_checked'] + app['frequency'] <= day):
        cmd = app['cmd'].replace('%d',str(date))


        subprocess.run(["notify-send","Autoscript",f"Autoscript Running \"{app['name']}\""])

        os.system(f"{cmd} || notify-send Autoscript \"{app['name']} failed to run\"")
        apps[i]['last_checked'] = day

print(apps)
print(prev_apps)



