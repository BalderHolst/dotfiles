import os
import usb.core

mount_point = "/run/media/Balder/Expansion/Backups/autobackup/"

backup_paths = ["/home/Balder/Documents/hjemmesider", "~/.scripts"]


def notify(messege):
   
    title = "Backup"

    messege = str(messege)
    messege = messege.replace(' ','\\ ')

    cmd = "notify-send " + title + " " + messege
    os.system(cmd)

def external_drives():
    return(os.popen('ls /run/media/Balder').read())

def backup():
    d = mount_point + "testdir" 
    os.system("mkdir " + d)
    for path in backup_paths:
        cmd = "cp -r " + path + " " + d + "/" + path.split('/')[-1] + "/."
        print(cmd)
        os.system(cmd)


dev = usb.core.find(find_all=1)

device_connected = False

for cfg in dev:
    if(cfg.idVendor == 0xbc2 and cfg.idProduct == 8249):
        device_connected = True
        
if device_connected:
    notify("Found backup USB drive!")
    
    backup()

else:
    notify("No backup drive connected..."



print("done!")

    
    
