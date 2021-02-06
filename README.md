# CrAnberry
Rooting the ChromeOS Android Subsystem post v77

After update v77 of ChromeOS, android was updated to version 9 and nolirium's [aroc project](https://github.com/nolirium/aroc) no longer worked. This is a script heavily inspired by their initial work, but made much more simple, and with the restrictions of at least ARMv7 v84 in mind.

Disclaimer: I am not responsible for any damage caused by this script.
Disclaimer 2: Right now, rooting requires SELinux must be set to permissive at all times. This is *extremely* insecure, and as such, you should only run code you absolutely trust using this (but you should have known that anyways).

# CrAnberry

To use it locally, save the cranberry.sh file to your Downloads folder, then copy it to your `/usr/local/bin` folder, and run `sudo /usr/local/bin/cranberry.sh`

To use it without downloading it, copy and paste the following in crosh: `curl https://raw.githubusercontent.com/RennBurris/CrAnberry/main/cranberry.sh | sudo sh`

This will generate an image at `/usr/local/cranberry` named "system.rooted.img" and symlink it to `/opt/google/containers/android/system.raw.img`


# revert.sh

This script will undo the changes done by Cranberry. Run it and then reboot to get your original android system without root back.
