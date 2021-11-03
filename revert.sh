#!/bin/bash

if ( ! test -z {,} ); then
    echo "Script must be run with sudo bash"
    exit 1;
fi

if [ -e /opt/google/containers/android/system.original.img ]; then
    echo "Removing Cranberry."
    echo " "
    rm /opt/google/containers/android/system.raw.img
    mv /opt/google/containers/android/system.original.img /opt/google/containers/android/system.raw.img
    
    if [ -e /etc/selinux/arc/policy/policy.30.bak ]; then
        cp /etc/selinux/arc/policy/policy.30.bak /etc/selinux/arc/policy/policy.30
        rm /etc/selinux/arc/policy/policy.30.bak
    fi
    
    rm -rf /usr/local/bak
    
    if [ -e /usr/local/cranberry/new/init.rc ]; then
        echo "Image is mounted on /usr/local/cranberry/new/"
        echo "Please reboot after running cranberry or unmount the image to prevent this from causing damage."
        exit 1
    fi
    
    if [ -e /usr/local/cranberry/original/init.rc ]; then
        echo "Image is mounted on /usr/local/cranberry/original/"
        echo "Please reboot after running cranberry or unmount the image manually."
        exit 1
    fi
    
    rm -rf /usr/local/cranberry
    rm /etc/init/unforce.conf
    rm /usr/local/bin/busybox
    
    echo "Now reboot and everything will be right as rain!"
    echo " "
    
else
    echo "Cranberry does not appear to be set up... Will clean up extra files anyways."
    echo " "
    
    rm -rf /usr/local/bak
    rm -rf /usr/local/cranberry
    rm /etc/init/unforce.conf
    rm /usr/local/bin/busybox
    
    echo "All done."
    echo " "

fi
