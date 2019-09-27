#!/bin/sh
# ** AUTO GENERATED **

# 2.3.2 - Ensure rsh client is not installed (Scored)

dpkg -s rsh-client | grep -E "Status: install ok installed"|| exit $1
dpkg -s rsh-redone-client | grep -E "Status: install ok installed"|| exit $1
