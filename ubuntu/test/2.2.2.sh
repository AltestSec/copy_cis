#!/bin/sh
# ** AUTO GENERATED **

# 2.2.2 - Ensure X Window System is not installed (Scored)

out=$(dpkg -l xserver-xorg*)
[[ -z "${out}" ]] || exit 1
