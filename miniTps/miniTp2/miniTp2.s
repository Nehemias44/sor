	.file	"miniTp2.c"
	.text
	.local	contador1
	.comm	contador1,4,4
	.local	contador2
	.comm	contador2,4,4
	.local	contador3
	.comm	contador3,4,4
	.local	caja
	.comm	caja,4,4
	.globl	equi1_semA
	.bss
	.align 32
	.type	equi1_semA, @object
	.size	equi1_semA, 32
equi1_semA:
	.zero	32
	.globl	equi1_semB
	.align 32
	.type	equi1_semB, @object
	.size	equi1_semB, 32
equi1_semB:
	.zero	32
	.globl	equi2_semA
	.align 32
	.type	equi2_semA, @object
	.size	equi2_semA, 32
equi2_semA:
	.zero	32
	.globl	equi2_semB
	.align 32
	.type	equi2_semB, @object
	.size	equi2_semB, 32
equi2_semB:
	.zero	32
	.globl	equi3_semA
	.align 32
	.type	equi3_semA, @object
	.size	equi3_semA, 32
equi3_semA:
	.zero	32
	.globl	equi3_semB
	.align 32
	.type	equi3_semB, @object
	.size	equi3_semB, 32
equi3_semB:
	.zero	32
	.globl	llegada_equi1
	.align 32
	.type	llegada_equi1, @object
	.size	llegada_equi1, 32
llegada_equi1:
	.zero	32
	.globl	llegada_equi2
	.align 32
	.type	llegada_equi2, @object
	.size	llegada_equi2, 32
llegada_equi2:
	.zero	32
	.globl	llegada_equi3
	.align 32
	.type	llegada_equi3, @object
	.size	llegada_equi3, 32
llegada_equi3:
	.zero	32
	.text
	.type	correr_equipo1_pthreadA, @function
correr_equipo1_pthreadA:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	equi1_semA(%rip), %rdi
	call	sem_wait@PLT
	jmp	.L2
.L3:
	movl	contador1(%rip), %eax
	addl	$1, %eax
	movl	%eax, contador1(%rip)
.L2:
	movl	contador1(%rip), %eax
	cmpl	$1073741822, %eax
	jle	.L3
	leaq	equi1_semB(%rip), %rdi
	call	sem_post@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	correr_equipo1_pthreadA, .-correr_equipo1_pthreadA
	.section	.rodata
	.align 8
.LC0:
	.string	"Equipo %d pthread B llego a la meta.\n"
	.text
	.type	correr_equipo1_pthreadB, @function
correr_equipo1_pthreadB:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	equi1_semB(%rip), %rdi
	call	sem_wait@PLT
	jmp	.L6
.L7:
	movl	contador1(%rip), %eax
	addl	$1, %eax
	movl	%eax, contador1(%rip)
.L6:
	movl	contador1(%rip), %eax
	cmpl	$2147483647, %eax
	jne	.L7
	leaq	equi1_semA(%rip), %rdi
	call	sem_post@PLT
	leaq	llegada_equi1(%rip), %rdi
	call	sem_wait@PLT
	movl	$1, caja(%rip)
	movl	caja(%rip), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	llegada_equi2(%rip), %rdi
	call	sem_post@PLT
	leaq	llegada_equi3(%rip), %rdi
	call	sem_post@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	correr_equipo1_pthreadB, .-correr_equipo1_pthreadB
	.type	correr_equipo2_pthreadA, @function
correr_equipo2_pthreadA:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	equi2_semA(%rip), %rdi
	call	sem_wait@PLT
	jmp	.L10
.L11:
	movl	contador2(%rip), %eax
	addl	$1, %eax
	movl	%eax, contador2(%rip)
.L10:
	movl	contador2(%rip), %eax
	cmpl	$1073741822, %eax
	jle	.L11
	leaq	equi2_semB(%rip), %rdi
	call	sem_post@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	correr_equipo2_pthreadA, .-correr_equipo2_pthreadA
	.type	correr_equipo2_pthreadB, @function
correr_equipo2_pthreadB:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	equi2_semB(%rip), %rdi
	call	sem_wait@PLT
	jmp	.L14
.L15:
	movl	contador2(%rip), %eax
	addl	$1, %eax
	movl	%eax, contador2(%rip)
.L14:
	movl	contador2(%rip), %eax
	cmpl	$2147483647, %eax
	jne	.L15
	leaq	equi2_semA(%rip), %rdi
	call	sem_post@PLT
	leaq	llegada_equi2(%rip), %rdi
	call	sem_wait@PLT
	movl	$2, caja(%rip)
	movl	caja(%rip), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	llegada_equi1(%rip), %rdi
	call	sem_post@PLT
	leaq	llegada_equi3(%rip), %rdi
	call	sem_post@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	correr_equipo2_pthreadB, .-correr_equipo2_pthreadB
	.type	correr_equipo3_pthreadA, @function
correr_equipo3_pthreadA:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	equi3_semA(%rip), %rdi
	call	sem_wait@PLT
	jmp	.L18
.L19:
	movl	contador3(%rip), %eax
	addl	$1, %eax
	movl	%eax, contador3(%rip)
.L18:
	movl	contador3(%rip), %eax
	cmpl	$1073741822, %eax
	jle	.L19
	leaq	equi3_semB(%rip), %rdi
	call	sem_post@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	correr_equipo3_pthreadA, .-correr_equipo3_pthreadA
	.type	correr_equipo3_pthreadB, @function
correr_equipo3_pthreadB:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	equi3_semB(%rip), %rdi
	call	sem_wait@PLT
	jmp	.L22
.L23:
	movl	contador3(%rip), %eax
	addl	$1, %eax
	movl	%eax, contador3(%rip)
.L22:
	movl	contador3(%rip), %eax
	cmpl	$2147483647, %eax
	jne	.L23
	leaq	equi3_semA(%rip), %rdi
	call	sem_post@PLT
	leaq	llegada_equi3(%rip), %rdi
	call	sem_wait@PLT
	movl	$3, caja(%rip)
	movl	caja(%rip), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	llegada_equi1(%rip), %rdi
	call	sem_post@PLT
	leaq	llegada_equi2(%rip), %rdi
	call	sem_post@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	correr_equipo3_pthreadB, .-correr_equipo3_pthreadB
	.section	.rodata
.LC1:
	.string	"Inicio la carrera."
.LC2:
	.string	"Termino la carrera."
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$1, %edx
	movl	$0, %esi
	leaq	equi1_semA(%rip), %rdi
	call	sem_init@PLT
	movl	$1, %edx
	movl	$0, %esi
	leaq	equi2_semA(%rip), %rdi
	call	sem_init@PLT
	movl	$1, %edx
	movl	$0, %esi
	leaq	equi3_semA(%rip), %rdi
	call	sem_init@PLT
	movl	$0, %edx
	movl	$0, %esi
	leaq	equi1_semB(%rip), %rdi
	call	sem_init@PLT
	movl	$0, %edx
	movl	$0, %esi
	leaq	equi2_semB(%rip), %rdi
	call	sem_init@PLT
	movl	$0, %edx
	movl	$0, %esi
	leaq	equi3_semB(%rip), %rdi
	call	sem_init@PLT
	movl	$1, %edx
	movl	$0, %esi
	leaq	llegada_equi1(%rip), %rdi
	call	sem_init@PLT
	movl	$1, %edx
	movl	$0, %esi
	leaq	llegada_equi2(%rip), %rdi
	call	sem_init@PLT
	movl	$1, %edx
	movl	$0, %esi
	leaq	llegada_equi3(%rip), %rdi
	call	sem_init@PLT
	leaq	-56(%rbp), %rax
	movl	$0, %ecx
	leaq	correr_equipo1_pthreadA(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	leaq	-40(%rbp), %rax
	movl	$0, %ecx
	leaq	correr_equipo2_pthreadA(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	leaq	-24(%rbp), %rax
	movl	$0, %ecx
	leaq	correr_equipo3_pthreadA(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	leaq	-48(%rbp), %rax
	movl	$0, %ecx
	leaq	correr_equipo1_pthreadB(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	leaq	-32(%rbp), %rax
	movl	$0, %ecx
	leaq	correr_equipo2_pthreadB(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	leaq	-16(%rbp), %rax
	movl	$0, %ecx
	leaq	correr_equipo3_pthreadB(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movq	-56(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	movq	-40(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	movq	-24(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	movq	-48(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	movq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	leaq	equi1_semA(%rip), %rdi
	call	sem_destroy@PLT
	leaq	equi2_semA(%rip), %rdi
	call	sem_destroy@PLT
	leaq	equi3_semA(%rip), %rdi
	call	sem_destroy@PLT
	leaq	equi1_semB(%rip), %rdi
	call	sem_destroy@PLT
	leaq	equi2_semB(%rip), %rdi
	call	sem_destroy@PLT
	leaq	equi3_semB(%rip), %rdi
	call	sem_destroy@PLT
	movl	$0, %edi
	call	pthread_exit@PLT
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.1 20201203"
	.section	.note.GNU-stack,"",@progbits
