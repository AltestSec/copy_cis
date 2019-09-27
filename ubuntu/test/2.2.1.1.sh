#!/bin/sh
# ** AUTO GENERATED **

# 2.2.1.1 - Ensure time synchronization is in use (Not Scored)

dpkg -s ntp | grep -E "Status: install ok installed"
app1=$?
dpkg -s chrony | grep -E "Status: install ok installed"
app2=$?

if [[ $app1 -eq 1 && $app2 -eq 1 ]]; then
        exit 1
fi
