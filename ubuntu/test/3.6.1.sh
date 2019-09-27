#!/bin/sh
# ** AUTO GENERATED **

# 3.6.1 - Ensure iptables is installed (Scored)

dpkg -s iptables |grep -E "iptables" || exit $?
