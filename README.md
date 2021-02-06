# CrAnberry
Rooting the ChromeOS Android Subsystem post v77

After update v77 of ChromeOS, the android subsystem was updated to version 9 (oreo) and nolirium's [aroc project](https://github.com/nolirium/aroc) no longer worked. This is a script heavily inspired by their initial work, but made much more simple, and with the restrictions of at least ARMv7 v84 in mind.

Disclaimer: I am not responsible for any damage caused by this script.
Disclaimer 2: Right now, rooting requires SELinux must be set to permissive at all times. This is *extremely* insecure, and as such, you should only run code you absolutely trust using this (but you should have known that anyways).

# CrAnberry

To use it locally, save the cranberry.sh file to your Downloads folder, then copy it to your `/usr/local/bin` folder, and run `sudo /usr/local/bin/cranberry.sh`

To use it without downloading it, copy and paste the following in crosh: `curl https://raw.githubusercontent.com/RennBurris/CrAnberry/main/cranberry.sh | sudo sh`

This will generate an image at `/usr/local/cranberry` named "system.rooted.img" and symlink it to `/opt/google/containers/android/system.raw.img`


# revert.sh

This script will undo the changes done by Cranberry. Run it and then reboot to get your original android system without root back.

# Notes

The image will not be mounted Read-Write, like AROC did. As far as I know, changing the arc properties to mount the system read-write completely trashes the image for some reason. You can make changes to the image by removing the symlink, rebooting, mounting the image rw, making the changes, then replacing the symlink and rebooting again. This means things that need RW access to the system (like Xposed?) probably won't work.


`sudo rm /opt/google/containers/android/system.raw.img`

then reboot

`mkdir /tmp/loop`

`mount -o rw,loop,sync /usr/local/cranberry/system.rooted.img /tmp/loop`

... make changes ...

`sudo umount /tmp/loop`

`sudo ln -s /usr/local/cranberry/system.rooted.img /opt/google/containers/android/system.raw.img`

and reboot again


If someone can find a way to make a RW system work without having to totally recreate the rooted image, please let me know so I can update my information.

Again: This currently requires SELinux to be set to Permissive at all times. This is very insecure and dangerous. There's also no SU Manager installed per this method as my testing so far has shown that it breaks the image, but I will probably (not) look into it again later on. You should be safe to install any SU Manager of your choice.
