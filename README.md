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
* attr -R (root)
* attr -S (security)
* https://elixir.bootlin.com/linux/v6.17/source/fs/ext4/xattr.h#L139
* https://elixir.bootlin.com/linux/v6.17/source/include/uapi/linux/xattr.h#L33

