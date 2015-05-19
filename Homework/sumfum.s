.section .data

n:
.long 0

result:
.long 0

.section .text

.global _start

_start:

movl $10, n
pushl n
call sum
addl $4,%esp
movl %eax,result
movl $1,%eax
movl result,%ebx
int $0x80

sum:

pushl %ebp
movl %esp,%ebp  
subl $4,%esp    
subl $4,%esp    

movl $1,-4(%ebp)
movl $0,-8(%ebp)

while:

movl -4(%ebp),%ebx
cmpl %ebx,8(%ebp) 
jl done

addl %ebx,-8(%ebp)
incl -4(%ebp)
jmp while

done:
movl -8(%ebp),%eax
movl %ebp,%esp
popl %ebp
ret