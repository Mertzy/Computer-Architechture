.section .data

message:
.ascii "mynameisisaac\n"

pos_max:
.long 0

location:
.long 1

length:
.long 11

.section .text

.globl _start
_start:

decl length

movl length, %edi

fillslot:
cmpl $0, %edi
jle done

movl $0, pos_max
movl $0, location

findMax:
incl location
cmpl location, %edi
jl swap

movl location, %esi
movb message( ,%esi,1), %al
movl pos_max, %esi
cmpb %al, message( ,%esi,1)
jg findMax

newMax:
movl location, %esi
movl %esi, pos_max
jmp findMax

swap:
movl pos_max, %esi
movb message( ,%edi,1), %al
movb message( ,%esi,1), %bl
movb %bl, message( ,%edi,1)
movb %al, message( ,%esi,1)

incl length

movl $4, %eax
movl $1, %ebx
movl $message, %ecx
movl length, %edx

int $0x80

decl %edi
jmp fillslot

#something not working correctly...not sure what the problem is


done:

movl $1, %eax