[bits 32]
[WARNING +all]
[WARNING error=label-orphan]
[extern _start]
 [section .text align=1]
[org 0x10000]

 _ehdr:
 db 0x7F, "ELF"

 _phdr:
 dd 1

 _off:
 dd 0, $$

 _e_type:
 dw 2

 _e_machine:
 dw 3

 _filesz:
 dd _start - -4

 _start_memsz:
 dd _start - -4

_start:
 dd 4
 times $$-$+41 nop
 db 169
 dw 0x20, 1
pop ebx
pop ebx
 pop ebx

is_infected:
 call ..@11.endstr

 ..@11.str:
 db `gnu.i\0`

 ..@11.endstr:
 pop ecx
 xor esi, esi
 push 1
 pop edi
 xor eax, eax
 mov al, 226
 int 0x80
test eax, eax
jnz already_infected

.end:

infect:
 push 6
 pop edx
 push 'ct'
 push 'infe'
 mov ecx, esp
 lea ebx, [edi]
 push 4
 pop eax
 int 0x80
dec eax

already_infected:
 xchg eax, edi
 xor ebx, ebx
 int 0x80
