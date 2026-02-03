%if 0
# polyglot shellscript/nasm file. Just run it as a shellscript to compile
. ./newlib/build.sh
%endif

%include "main.mac"		; main library
;elf simple			; add simple ELF header, PHDR gets automatically added with "simple"
elf
ELF_PHDR 1
setxattr "5", `user.\x01foo`, "bar"
rset	eax, 0
exit
