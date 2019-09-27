#!/bin/sh
# ** AUTO GENERATED **

# 3.4.1 - Ensure TCP Wrappers is installed (Scored)

dpkg -s tpcd |grep -E "tcp_wrappers-" || exit $?
ldd $(whereis tcpd|awk '{print$2}')|grep libwrap.so || exit $?
