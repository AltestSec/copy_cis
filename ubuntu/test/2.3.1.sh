#!/bin/sh
# ** AUTO GENERATED **

# 2.3.1 - Ensure NIS Client is not installed (Scored)

#dpkg -s nis | grep -E "Status: install ok installed" || exit $1
dpkg -l |grep nis|grep -E "nis"
