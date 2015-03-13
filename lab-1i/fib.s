	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}

	@init parameter
	@previous = -1; r3
  	@result = 1; r4
  	@i=0; r5
  	@sum=0; r6

	mov r3, #-1
	mov r4, #1
	mov r5, #0
	mov r6, #0

.L:
	@sum = result + previous;
    	@previous = result;
    	@result = sum;
	add r6, r4, r3
	mov r3, r4
	mov r4, r6
	
	@i++
	adds r5, #1 

	@r0:parameter x
	cmp r0,r5
	bne .L

	mov r0, r4
	pop {r3, r4, r5, pc}		@EPILOG
	.size fibonacci, .-fibonacci
	.end
