#!/bin/sh
# ** AUTO GENERATED **

# 2.1.11 - Ensure the openbsd-inetd is not installed (Scored)

dpkg -s openbsd-inetd | grep -E "dpkg-query: package 'openbsd-inetd' is not installed and no information is available"
