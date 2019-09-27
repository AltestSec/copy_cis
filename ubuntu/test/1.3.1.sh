#!/bin/sh
# ** AUTO GENERATED **

# 1.3.1 - Ensure AIDE is installed (Scored)

dpkg -s aide|grep -E "Status: install ok installed" || exit $?