#!/bin/sh
# ** AUTO GENERATED **

# 1.5.4 - Ensure prelink is disabled (Scored)

#dpkg -s prelink|grep -E "package prelink is not installed"||exit $?
#dpkg -s prelink|grep -E "Status: install ok installed"|| exit $1
apt list|grep prelink|grep -E "prelink"||exit $1

