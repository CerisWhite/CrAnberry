#!/bin/sh

if [ -e /opt/google/containers/android/system.original.img ]; then
    echo "Removing Cranberry.\n"
    rm /opt/google/containers/android/system.raw.img
    mv /opt/google/containers/android/system.original.img /opt/google/containers/android/system.raw.img
    
    if [ -e /etc/selinux/arc/policy/policy.30.bak ]; then
        cp /etc/selinux/arc/policy/policy.30.bak /etc/selinux/arc/policy/policy.30
        rm /etc/selinux/arc/policy/policy.30.bak
    fi
    
    rm -rf /usr/local/bak
    rm -rf /usr/local/cranberry
    
    echo "Now reboot and everything will be right as rain!\n"
    
else
    echo "Cranberry does not appear to be set up... Will clean up extra files anyways.\n"
    
    rm -rf /usr/local/bak
    rm -rf /usr/local/cranberry
    
    echo "All done.\n"

fi