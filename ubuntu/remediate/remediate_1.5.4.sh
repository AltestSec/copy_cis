#!/bin/sh
# ** AUTO GENERATED **

# 1.5.4 - Ensure prelink is disabled (Scored)

prelink -ua
apt-get remove prelink -y
