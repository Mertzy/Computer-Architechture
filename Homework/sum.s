#Assembly language summation program. Follows n(n+1)/2

#Assemble with as --32 -o sum.o sum.s

#Link with ld -melf_i386 -o sum sum.o

#Run with ./sum


.section .data

#no data in this program
	
.section .text

.global _start
_start:


movl $10, %ebx
movl %ebx, %ecx
incl %ecx

imull %ebx, %ecx

movl %ecx, %eax
cdq
movl $2, %ebx
idivl %ebx

movl %eax, %ebx

movl $1, %eax



	
int $0x80
