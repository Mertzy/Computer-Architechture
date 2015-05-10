.section .data

n:
  .long 5

i:
  .long 1

total:
  .long 0


.section .text
.globl _start
_start:

movl i, %ecx
movl total, %eax
movl n, %edx

while:

  cmpl %ecx,%edx
  jge falseclause
  movl %eax,%ebx
  jmp done

falseclause:

  addl %ecx,%eax
  incl %ecx
  jmp while

done:

  movl $1,%eax
  int $0x80
