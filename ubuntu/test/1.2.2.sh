#!/bin/sh
# ** AUTO GENERATED **

# 1.2.2 - Ensure AIDE is installed (Scored)

apt-key list|egrep -v 'uid|^$|--|pub|gpg'|cut -c 38-60| sed 's/ //g'|| exit $?
