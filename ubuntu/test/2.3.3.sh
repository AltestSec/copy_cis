#!/bin/sh
# ** AUTO GENERATED **

# 2.3.3 - Ensure talk client is not installed (Scored)

#dpkg -s talk | grep -E "package talk is not installed" || exit $1
apt list|grep talk|grep -E "talk"||exit $1
