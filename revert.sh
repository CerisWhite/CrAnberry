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
    rm -rf /usr/local/cranberry
    rm /etc/init/unforce.conf
    
    echo "Now reboot and everything will be right as rain!"
    echo " "
    
else
    echo "Cranberry does not appear to be set up... Will clean up extra files anyways."
    echo " "
    
    rm -rf /usr/local/bak
    rm -rf /usr/local/cranberry
    rm /etc/init/unforce.conf
    
    echo "All done."
    echo " "

fi
