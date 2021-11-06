# CrAnberry
Rooting the ChromeOS Android Subsystem post v77

After update v77 of ChromeOS, the android subsystem was updated to version 9 (Pie) and nolirium's [aroc project](https://github.com/nolirium/aroc) no longer worked. This is a script heavily inspired by their initial work, but made much more simple, and with the restrictions of at least ARMv7 v84 in mind.

Disclaimer: I am not responsible for any damage caused by this script. Always back up your data (or don't, it's your device)
Disclaimer 2: Right now, rooting requires SELinux must be set to permissive at all times. This is *extremely* insecure, and as such, you should only run code you absolutely trust using this (but you should have known that anyways).

# cranberry.sh

To use it locally, save the cranberry.sh file to your Downloads folder, then copy it to your `/usr/local/bin` directory, and run `sudo bash /usr/local/bin/cranberry.sh`

To use it directly, copy and paste the following in crosh: 

`curl https://raw.githubusercontent.com/CerisWhite/CrAnberry/main/cranberry.sh | sudo bash`

This will generate an image at `/usr/local/cranberry` named "system.rooted.img" and symlink it to `/opt/google/containers/android/system.raw.img`

# revert.sh

This script will undo the changes done by Cranberry. Run it and then reboot to get your original android system without root back. It can be run exactly as above:

`curl https://raw.githubusercontent.com/CerisWhite/CrAnberry/main/revert.sh | sudo bash`

# Notes

The image will not be mounted Read-Write, like AROC did. With Android 9, it's impossible to mount an image read-write period. While you can change the config.json to tell it to mount the image read-write, the directory `/opt/google/containers/android/rootfs/root` will remain read-only regardless and cannot be remounted rw.
You can make changes to a cranberry image by removing the symlink, rebooting, mounting the image manually, making the changes, then replacing the symlink and rebooting again, like so:


`sudo rm /opt/google/containers/android/system.raw.img`

then reboot

`mkdir /tmp/loop`

`mount -o rw,loop,sync /usr/local/cranberry/system.rooted.img /tmp/loop`

... make changes ...

`sudo umount /tmp/loop`

`sudo ln -s /usr/local/cranberry/system.rooted.img /opt/google/containers/android/system.raw.img`

and reboot again

# Closing Notes
If someone can find a way to make a RW system work, please let me know so I can update my information. As of right now, what I know is:

A) Setting the init.rc to mount the system rw causes the image to not load, but it can be undone using the process above.

B) Setting the system to mount rw in config.json will allow a clean image to mount properly, but still be read-only, while it will completely trash cranberry images. A trashed image cannot be salvaged and will need to be recreated.

# IMPORTANT
Because the system cannot be mounted read-write, things that want to patch the system (Lucky Patcher android patches, Xposed, etc.) will not work. Other root apps (GameGuardian, SB Game Hacker) will work just fine, though!

Again: This currently requires SELinux to be set to Permissive at all times. This is very insecure and dangerous. There's also no SU Manager installed in the system per this method as my testing so far has shown that it breaks the image, but I will probably (not) look into it again later on. Installing an SU manager also doesn't work as it requires the system to be read-write to update the su files. Be very very careful about what code you run on your machine.

If you have any questions (or don't want to open a public issue), you can find me on Discord (Ceris#2530).
