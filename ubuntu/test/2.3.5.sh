#!/bin/sh
# ** AUTO GENERATED **

# 2.3.5 - Ensure LDAP client is not installed (Scored)

#dpkg -s ldap-utils | grep -E "package openldap-clients is not installed" || exit $1
apt list|grep ldap-utils|grep -E "ldap-utils"||exit $1
