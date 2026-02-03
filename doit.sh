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

echo "---- attr 1:"
attr -l 1
attr -g "foo" 1
echo "---- attr 2:"
attr -l 2
attr -g "foo" 2
attr -g "baz" 2
echo "---- attr 3:"
attr -l 2
attr -l 3

echo "---- getfattr 1:"
getfattr -d 1
echo "---- getfattr 1 all:"
getfattr -m - -d 1
echo "---- getfattr 2:"
getfattr -d 2
echo "---- getfattr 2 all:"
getfattr -m - -d 2
echo "---- getfattr 3:"
getfattr -d 3
echo "---- getfattr 3 all:"
getfattr -m - -d 3
