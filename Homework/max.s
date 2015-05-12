.section .data
data_items:	 .long 5,2,7,4,9,4
max_val:	 .long 0

.section .text
.global _start

_start:
	        movl $0, %edi   # init counter to 0
	        movl max_val, %ebx
start_loop:
	        movl data_items(,%edi,4), %eax
	        cmpl $0, %eax
	        je loop_exit    # go to end if 0 encountered

	        incl %edi

	        cmpl %ebx, %eax
	        jle start_loop  # if new value < max value in ebx, read next element

	        movl %eax, %ebx
	        jmp start_loop

loop_exit:
	        movl $1, %eax
	        int $0x80
