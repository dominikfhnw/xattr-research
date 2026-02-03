#!/bin/sh
touch 1
attr -s foo -V bar 1

touch 2
strace -rn setfattr -n "gnu.foo" -v bar 2
setfattr -n "user.baz" -v bar 2

touch 3
setfattr -n "security.nsecurity" -v bar 3
setfattr -n "trusted.ntrusted" -v bar 3
setfattr -n "system.nsystem" -v bar 3

echo "----"
attr -l 1
attr -l 2
attr -l 3

echo "----"
getfattr -m - -d 1
getfattr -m - -d 2
getfattr -m - -d 3
