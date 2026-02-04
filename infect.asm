%if 0
# polyglot shellscript/nasm file. Just run it as a shellscript to assemble
DUMP="--no-addresses -Mintel"
. ./asmlib2/build.sh
%endif

%assign X32 0

%ifnidn __OUTPUT_FORMAT__, bin
	%assign X32 0
%endif
%if X32
	BITS 64
%else
	BITS 32
%endif

%include "main.mac"
elf simple

%define zero_seg	0
%define reg_inc		0
%define stack_cleanup	0

; read argv[1] into ebx
pop	embiggen(ebx)
pop	embiggen(ebx)

; don't assume anything about register values
rtaint
%if X32
	mov	ebx, ebx
%else
	pop	ebx
%endif
is_infected:
piestring sc_arg2, `gnu.i\0`

setxattr x, x, x, 0, XATTR_CREATE
test	eax, eax
jnz	already_infected


.end:
%warning size: %eval(is_infected.end-is_infected)

infect:
puts	"infect"
dec	eax

already_infected:
exit
