#!/bin/sh
# ** AUTO GENERATED **

# 1.6.3 - Ensure Selinux and apparmor is installed (Scored)

dpkg -s selinux | grep -E "Status: install ok installed" || exit $1
dpkg -s apparmor | grep -E "Status: install ok installed" || exit $1
