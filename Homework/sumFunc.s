.section .data

n:
	.long 5

answer:

	.long 0


.section .text

.globl _start
_start:

	pushl n
	call summation
	addl $8, %esp
	movl %eax, answer

	movl answer, %ebx
	movl $1, %eax
	int $0x080


	
summation:

	pushl %ebp
	movl %esp, %ebp

	subl $4, %esp
	subl $4, %esp

	movl $1, -4(%ebp)
	movl $1, -8(%ebp)
	


while:

	movl 8(%ebp), %ecx
	cmpl -8(%ebp), %ecx
	jle increment

	cmpl -8(%ebp), %ecx
	jg done


increment:

	movl -4(%ebp), %eax
	addl #????????????????
	

	incl -8(%ebp)
	jmp while

	
done:

	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
	
	
