The two main tools to inspect/change xattrs on Linux:
* attr
* setfattr
On Debian both are in the package "attr", which is not installe by default

Man page: man 7 xattr

Namespaces:
* os2 (JFS)
* osx (HFS+)
* btrfs (BTRFS)
* gnu (EXT4)
* security
* system
* trusted
* user
* attr -R (root) => trusted
* attr -S (security) => security
* https://elixir.bootlin.com/linux/v6.17/source/fs/ext4/xattr.h#L139
* https://elixir.bootlin.com/linux/v6.17/source/include/uapi/linux/xattr.h#L33

Hiding attrs:
* if root: use "trusted" namespace, can only be read by root
* `attr` is useless with most namespaces
* use `gnu` namespace on ext4, is hidden by default from setfattr, and impossible to view with attr
