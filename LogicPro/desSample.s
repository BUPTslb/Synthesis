	.text
	.file	"desSample.cpp"
	.globl	_Z20print_char_as_binaryc       # -- Begin function _Z20print_char_as_binaryc
	.p2align	4, 0x90
	.type	_Z20print_char_as_binaryc,@function
_Z20print_char_as_binaryc:              # @_Z20print_char_as_binaryc
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	xorl	%edi, %edi
	testb	%bl, %bl
	setns	%dil
	xorl	$49, %edi
	callq	putchar@PLT
	movl	%ebx, %eax
	andl	$64, %eax
	cmpl	$1, %eax
	movl	$49, %ebp
	movl	$49, %edi
	sbbl	$0, %edi
	callq	putchar@PLT
	movl	%ebx, %eax
	andl	$32, %eax
	cmpl	$1, %eax
	movl	$49, %edi
	sbbl	$0, %edi
	callq	putchar@PLT
	movl	%ebx, %eax
	andl	$16, %eax
	cmpl	$1, %eax
	movl	$49, %edi
	sbbl	$0, %edi
	callq	putchar@PLT
	movl	%ebx, %eax
	andl	$8, %eax
	cmpl	$1, %eax
	movl	$49, %edi
	sbbl	$0, %edi
	callq	putchar@PLT
	movl	%ebx, %eax
	andl	$4, %eax
	cmpl	$1, %eax
	movl	$49, %edi
	sbbl	$0, %edi
	callq	putchar@PLT
	movl	%ebx, %eax
	andl	$2, %eax
	cmpl	$1, %eax
	sbbl	$0, %ebp
	movl	%ebp, %edi
	callq	putchar@PLT
	andl	$1, %ebx
	orl	$48, %ebx
	movl	%ebx, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	putchar@PLT                     # TAILCALL
.Lfunc_end0:
	.size	_Z20print_char_as_binaryc, .Lfunc_end0-_Z20print_char_as_binaryc
	.cfi_endproc
                                        # -- End function
	.globl	_Z17subkey_generationPKcP7key_set # -- Begin function _Z17subkey_generationPKcP7key_set
	.p2align	4, 0x90
	.type	_Z17subkey_generationPKcP7key_set,@function
_Z17subkey_generationPKcP7key_set:      # @_Z17subkey_generationPKcP7key_set
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	leaq	initial_key_permutaion(%rip), %rax
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	(%rax), %ecx
	leal	-1(%rcx), %ebp
	leal	6(%rcx), %ebx
	testl	%ebp, %ebp
	cmovnsl	%ebp, %ebx
	movl	%ebx, %ebp
	andl	$-8, %ebp
	negl	%ebp
	addl	%ebp, %ecx
	addl	$-1, %ecx
	movl	$128, %ebp
	shrl	%cl, %ebp
	sarl	$3, %ebx
	movslq	%ebx, %rbx
	andb	(%rdi,%rbx), %bpl
	movzbl	%bpl, %ebp
                                        # kill: def $cl killed $cl killed $ecx
	shll	%cl, %ebp
	movzbl	%bpl, %ebp
	movl	%edx, %ecx
	andb	$7, %cl
	shrl	%cl, %ebp
	movl	%edx, %ecx
	shrl	$3, %ecx
	orb	%bpl, (%rsi,%rcx)
	addq	$1, %rdx
	addq	$4, %rax
	cmpq	$56, %rdx
	jne	.LBB1_1
# %bb.2:
	movb	(%rsi), %dil
	movb	1(%rsi), %al
	movb	2(%rsi), %r14b
	movb	3(%rsi), %r15b
	movl	%r15d, %r12d
	shlb	$4, %r12b
	movb	4(%rsi), %dl
	movl	%edx, %r9d
	shrb	$4, %r9b
	orb	%r12b, %r9b
	shlb	$4, %dl
	movb	5(%rsi), %cl
	movl	%ecx, %r10d
	shrb	$4, %r10b
	orb	%dl, %r10b
	shlb	$4, %cl
	movb	6(%rsi), %r8b
	movl	%r8d, %r11d
	shrb	$4, %r11b
	orb	%cl, %r11b
	movl	%r8d, %r13d
	shlb	$4, %r13b
	movl	%eax, %ebx
	shrb	$7, %bl
	leal	(%rdi,%rdi), %ebp
	orb	%bl, %bpl
	movb	%bpl, 8(%rsi)
	movl	%r14d, %ebx
	shrb	$7, %bl
	addb	%al, %al
	orb	%bl, %al
	movb	%al, 9(%rsi)
	movl	%r15d, %eax
	shrb	$7, %al
	addb	%r14b, %r14b
	orb	%al, %r14b
	movb	%r14b, 10(%rsi)
	addb	%r15b, %r15b
	andb	$-32, %r15b
	shrb	$3, %dil
	andb	$16, %dil
	orb	%r15b, %dil
	movb	%dil, 11(%rsi)
	addb	%r9b, %r9b
	shrb	$7, %dl
	orb	%r9b, %dl
	movb	%dl, 12(%rsi)
	addb	%r10b, %r10b
	shrb	$7, %cl
	orb	%r10b, %cl
	movb	%cl, 13(%rsi)
	addb	%r11b, %r11b
	shrb	$7, %r13b
	orb	%r11b, %r13b
	movb	%r13b, 14(%rsi)
	shlb	$5, %r8b
	shrb	$3, %r12b
	orb	%r8b, %r12b
	andb	$-16, %r12b
	movb	%r12b, 15(%rsi)
	leaq	sub_key_permutation(%rip), %rax
	xorl	%edx, %edx
	jmp	.LBB1_3
	.p2align	4, 0x90
.LBB1_5:                                #   in Loop: Header=BB1_3 Depth=1
	addl	$-29, %edi
	movl	%edi, %ecx
	andl	$7, %ecx
	shrl	$3, %edi
	addq	%rsi, %rdi
	addq	$12, %rdi
.LBB1_6:                                #   in Loop: Header=BB1_3 Depth=1
	movl	$128, %ebp
	shrl	%cl, %ebp
	andb	(%rdi), %bpl
	movzbl	%bpl, %edi
                                        # kill: def $cl killed $cl killed $ecx
	shll	%cl, %edi
	movzbl	%dil, %edi
	movl	%edx, %ecx
	andb	$7, %cl
	shrl	%cl, %edi
	movl	%edx, %ecx
	shrl	$3, %ecx
	orb	%dil, (%rsi,%rcx)
	addq	$1, %rdx
	addq	$4, %rax
	cmpq	$48, %rdx
	je	.LBB1_7
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
	movl	(%rax), %edi
	cmpl	$28, %edi
	jg	.LBB1_5
# %bb.4:                                #   in Loop: Header=BB1_3 Depth=1
	leal	-1(%rdi), %ecx
	leal	6(%rdi), %ebp
	testl	%ecx, %ecx
	cmovnsl	%ecx, %ebp
	movl	%ebp, %ecx
	andl	$-8, %ecx
	negl	%ecx
	addl	%edi, %ecx
	addl	$-1, %ecx
	sarl	$3, %ebp
	movslq	%ebp, %rdi
	addq	%rsi, %rdi
	addq	$8, %rdi
	jmp	.LBB1_6
.LBB1_7:
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	_Z17subkey_generationPKcP7key_set, .Lfunc_end1-_Z17subkey_generationPKcP7key_set
	.cfi_endproc
                                        # -- End function
	.globl	_Z15process_messagePKcPhP7key_set # -- Begin function _Z15process_messagePKcPhP7key_set
	.p2align	4, 0x90
	.type	_Z15process_messagePKcPhP7key_set,@function
_Z15process_messagePKcPhP7key_set:      # @_Z15process_messagePKcPhP7key_set
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$0, (%rsi)
	movl	(%rdi), %r8d
	movl	4(%rdi), %eax
	movl	%eax, -4(%rsp)
	movl	$0, -12(%rsp)
	movw	$0, -8(%rsp)
	leaq	message_expansion(%rip), %rax
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	movl	(%rax), %ecx
	leal	-1(%rcx), %ebp
	leal	6(%rcx), %ebx
	testl	%ebp, %ebp
	cmovnsl	%ebp, %ebx
	movl	%ebx, %ebp
	andl	$-8, %ebp
	negl	%ebp
	addl	%ebp, %ecx
	addl	$-1, %ecx
	movl	$128, %ebp
	shrl	%cl, %ebp
	sarl	$3, %ebx
	movslq	%ebx, %rbx
	andb	-4(%rsp,%rbx), %bpl
	movzbl	%bpl, %ebp
                                        # kill: def $cl killed $cl killed $ecx
	shll	%cl, %ebp
	movzbl	%bpl, %ebp
	movl	%edi, %ecx
	andb	$7, %cl
	shrl	%cl, %ebp
	movl	%edi, %ecx
	shrl	$3, %ecx
	orb	%bpl, -12(%rsp,%rcx)
	addq	$1, %rdi
	addq	$4, %rax
	cmpq	$48, %rdi
	jne	.LBB2_1
# %bb.2:
	movb	-12(%rsp), %al
	movb	-11(%rsp), %bl
	xorb	(%rdx), %al
	xorb	1(%rdx), %bl
	movb	-10(%rsp), %r14b
	xorb	2(%rdx), %r14b
	movb	-9(%rsp), %bpl
	xorb	3(%rdx), %bpl
	movb	-8(%rsp), %r11b
	xorb	4(%rdx), %r11b
	movb	-7(%rsp), %r9b
	xorb	5(%rdx), %r9b
	movl	%eax, %edx
	shrb	$6, %dl
	andb	$2, %dl
	movl	%eax, %ecx
	shrb	$2, %cl
	andb	$1, %cl
	orb	%dl, %cl
	movl	%eax, %edx
	shrb	$3, %dl
	andb	$15, %dl
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	shlq	$6, %rcx
	leaq	S(%rip), %rdi
	addq	%rdi, %rcx
	movb	(%rcx,%rdx,4), %r10b
	shlb	$4, %r10b
	movl	%eax, %ecx
	andb	$2, %cl
	movl	%ebx, %edx
	shrb	$4, %dl
	andb	$1, %dl
	orb	%cl, %dl
	movl	%ebx, %ecx
	shrb	$5, %cl
	shlb	$3, %al
	orb	%cl, %al
	andb	$15, %al
	movzbl	%dl, %ecx
	movzbl	%al, %eax
	shlq	$6, %rcx
	addq	%rdi, %rcx
	orb	(%rcx,%rax,4), %r10b
	movl	%ebx, %eax
	shrb	$2, %al
	andb	$2, %al
	movl	%r14d, %ecx
	shrb	$6, %cl
	andb	$1, %cl
	orb	%al, %cl
	movl	%r14d, %eax
	shrb	$7, %al
	addb	%bl, %bl
	orb	%al, %bl
	andb	$15, %bl
	movzbl	%cl, %eax
	movzbl	%bl, %ecx
	shlq	$6, %rax
	addq	%rdi, %rax
	movb	(%rax,%rcx,4), %r15b
	shlb	$4, %r15b
	movl	%r14d, %eax
	shrb	$4, %al
	andb	$2, %al
	movl	%r14d, %ecx
	andb	$1, %cl
	orb	%al, %cl
	shrb	%r14b
	andb	$15, %r14b
	movzbl	%cl, %eax
	movzbl	%r14b, %ecx
	shlq	$6, %rax
	addq	%rdi, %rax
	orb	(%rax,%rcx,4), %r15b
	movl	%ebp, %eax
	shrb	$6, %al
	andb	$2, %al
	movl	%ebp, %ecx
	shrb	$2, %cl
	andb	$1, %cl
	orb	%al, %cl
	movl	%ebp, %eax
	shrb	$3, %al
	andb	$15, %al
	movzbl	%cl, %ecx
	movzbl	%al, %eax
	shlq	$6, %rcx
	addq	%rdi, %rcx
	movb	(%rcx,%rax,4), %al
	shlb	$4, %al
	movl	%ebp, %ecx
	andb	$2, %cl
	movl	%r11d, %ebx
	shrb	$4, %bl
	andb	$1, %bl
	orb	%cl, %bl
	movl	%r11d, %ecx
	shrb	$5, %cl
	shlb	$3, %bpl
	orb	%cl, %bpl
	andb	$15, %bpl
	movzbl	%bl, %ecx
	movzbl	%bpl, %ebx
	shlq	$6, %rcx
	addq	%rdi, %rcx
	orb	(%rcx,%rbx,4), %al
	movl	%r11d, %ecx
	shrb	$2, %cl
	andb	$2, %cl
	movl	%r9d, %ebx
	shrb	$6, %bl
	andb	$1, %bl
	orb	%cl, %bl
	movl	%r9d, %ecx
	shrb	$7, %cl
	addb	%r11b, %r11b
	orb	%cl, %r11b
	andb	$15, %r11b
	movzbl	%bl, %ecx
	movzbl	%r11b, %ebp
	shlq	$6, %rcx
	addq	%rdi, %rcx
	movb	(%rcx,%rbp,4), %cl
	shlb	$4, %cl
	movl	%r9d, %ebx
	shrb	$4, %bl
	andb	$2, %bl
	movl	%r9d, %edx
	andb	$1, %dl
	orb	%bl, %dl
	shrb	%r9b
	andb	$15, %r9b
	movzbl	%dl, %edx
	movzbl	%r9b, %ebp
	shlq	$6, %rdx
	addq	%rdi, %rdx
	orb	(%rdx,%rbp,4), %cl
	movl	%r8d, (%rsi)
	movb	%r10b, 4(%rsi)
	movb	%r15b, 5(%rsi)
	movb	%al, 6(%rsi)
	movb	%cl, 7(%rsi)
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	_Z15process_messagePKcPhP7key_set, .Lfunc_end2-_Z15process_messagePKcPhP7key_set
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movl	$8, %edi
	callq	malloc@PLT
	movq	%rax, %r14
	movl	$8, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	leaq	.L.str.3(%rip), %rdi
	movq	%rax, %rsi
	callq	_Z17subkey_generationPKcP7key_set
	leaq	.L.str.2(%rip), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	_Z15process_messagePKcPhP7key_set
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
                                        # -- End function
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function _GLOBAL__sub_I_desSample.cpp
	.type	_GLOBAL__sub_I_desSample.cpp,@function
_GLOBAL__sub_I_desSample.cpp:           # @_GLOBAL__sub_I_desSample.cpp
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	leaq	_ZStL8__ioinit(%rip), %rbx
	movq	%rbx, %rdi
	callq	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	leaq	__dso_handle(%rip), %rdx
	movq	%rbx, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit@PLT                # TAILCALL
.Lfunc_end4:
	.size	_GLOBAL__sub_I_desSample.cpp, .Lfunc_end4-_GLOBAL__sub_I_desSample.cpp
	.cfi_endproc
                                        # -- End function
	.type	_ZStL8__ioinit,@object          # @_ZStL8__ioinit
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.type	initial_key_permutaion,@object  # @initial_key_permutaion
	.data
	.globl	initial_key_permutaion
	.p2align	4
initial_key_permutaion:
	.long	57                              # 0x39
	.long	49                              # 0x31
	.long	41                              # 0x29
	.long	33                              # 0x21
	.long	25                              # 0x19
	.long	17                              # 0x11
	.long	9                               # 0x9
	.long	1                               # 0x1
	.long	58                              # 0x3a
	.long	50                              # 0x32
	.long	42                              # 0x2a
	.long	34                              # 0x22
	.long	26                              # 0x1a
	.long	18                              # 0x12
	.long	10                              # 0xa
	.long	2                               # 0x2
	.long	59                              # 0x3b
	.long	51                              # 0x33
	.long	43                              # 0x2b
	.long	35                              # 0x23
	.long	27                              # 0x1b
	.long	19                              # 0x13
	.long	11                              # 0xb
	.long	3                               # 0x3
	.long	60                              # 0x3c
	.long	52                              # 0x34
	.long	44                              # 0x2c
	.long	36                              # 0x24
	.long	63                              # 0x3f
	.long	55                              # 0x37
	.long	47                              # 0x2f
	.long	39                              # 0x27
	.long	31                              # 0x1f
	.long	23                              # 0x17
	.long	15                              # 0xf
	.long	7                               # 0x7
	.long	62                              # 0x3e
	.long	54                              # 0x36
	.long	46                              # 0x2e
	.long	38                              # 0x26
	.long	30                              # 0x1e
	.long	22                              # 0x16
	.long	14                              # 0xe
	.long	6                               # 0x6
	.long	61                              # 0x3d
	.long	53                              # 0x35
	.long	45                              # 0x2d
	.long	37                              # 0x25
	.long	29                              # 0x1d
	.long	21                              # 0x15
	.long	13                              # 0xd
	.long	5                               # 0x5
	.long	28                              # 0x1c
	.long	20                              # 0x14
	.long	12                              # 0xc
	.long	4                               # 0x4
	.size	initial_key_permutaion, 224

	.type	sub_key_permutation,@object     # @sub_key_permutation
	.globl	sub_key_permutation
	.p2align	4
sub_key_permutation:
	.long	14                              # 0xe
	.long	17                              # 0x11
	.long	11                              # 0xb
	.long	24                              # 0x18
	.long	1                               # 0x1
	.long	5                               # 0x5
	.long	3                               # 0x3
	.long	28                              # 0x1c
	.long	15                              # 0xf
	.long	6                               # 0x6
	.long	21                              # 0x15
	.long	10                              # 0xa
	.long	23                              # 0x17
	.long	19                              # 0x13
	.long	12                              # 0xc
	.long	4                               # 0x4
	.long	26                              # 0x1a
	.long	8                               # 0x8
	.long	16                              # 0x10
	.long	7                               # 0x7
	.long	27                              # 0x1b
	.long	20                              # 0x14
	.long	13                              # 0xd
	.long	2                               # 0x2
	.long	41                              # 0x29
	.long	52                              # 0x34
	.long	31                              # 0x1f
	.long	37                              # 0x25
	.long	47                              # 0x2f
	.long	55                              # 0x37
	.long	30                              # 0x1e
	.long	40                              # 0x28
	.long	51                              # 0x33
	.long	45                              # 0x2d
	.long	33                              # 0x21
	.long	48                              # 0x30
	.long	44                              # 0x2c
	.long	49                              # 0x31
	.long	39                              # 0x27
	.long	56                              # 0x38
	.long	34                              # 0x22
	.long	53                              # 0x35
	.long	46                              # 0x2e
	.long	42                              # 0x2a
	.long	50                              # 0x32
	.long	36                              # 0x24
	.long	29                              # 0x1d
	.long	32                              # 0x20
	.size	sub_key_permutation, 192

	.type	message_expansion,@object       # @message_expansion
	.globl	message_expansion
	.p2align	4
message_expansion:
	.long	32                              # 0x20
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	4                               # 0x4
	.long	5                               # 0x5
	.long	4                               # 0x4
	.long	5                               # 0x5
	.long	6                               # 0x6
	.long	7                               # 0x7
	.long	8                               # 0x8
	.long	9                               # 0x9
	.long	8                               # 0x8
	.long	9                               # 0x9
	.long	10                              # 0xa
	.long	11                              # 0xb
	.long	12                              # 0xc
	.long	13                              # 0xd
	.long	12                              # 0xc
	.long	13                              # 0xd
	.long	14                              # 0xe
	.long	15                              # 0xf
	.long	16                              # 0x10
	.long	17                              # 0x11
	.long	16                              # 0x10
	.long	17                              # 0x11
	.long	18                              # 0x12
	.long	19                              # 0x13
	.long	20                              # 0x14
	.long	21                              # 0x15
	.long	20                              # 0x14
	.long	21                              # 0x15
	.long	22                              # 0x16
	.long	23                              # 0x17
	.long	24                              # 0x18
	.long	25                              # 0x19
	.long	24                              # 0x18
	.long	25                              # 0x19
	.long	26                              # 0x1a
	.long	27                              # 0x1b
	.long	28                              # 0x1c
	.long	29                              # 0x1d
	.long	28                              # 0x1c
	.long	29                              # 0x1d
	.long	30                              # 0x1e
	.long	31                              # 0x1f
	.long	32                              # 0x20
	.long	1                               # 0x1
	.size	message_expansion, 192

	.type	S,@object                       # @S
	.globl	S
	.p2align	4
S:
	.long	14                              # 0xe
	.long	4                               # 0x4
	.long	13                              # 0xd
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	15                              # 0xf
	.long	11                              # 0xb
	.long	8                               # 0x8
	.long	3                               # 0x3
	.long	10                              # 0xa
	.long	6                               # 0x6
	.long	12                              # 0xc
	.long	5                               # 0x5
	.long	9                               # 0x9
	.long	0                               # 0x0
	.long	7                               # 0x7
	.long	0                               # 0x0
	.long	15                              # 0xf
	.long	7                               # 0x7
	.long	4                               # 0x4
	.long	14                              # 0xe
	.long	2                               # 0x2
	.long	13                              # 0xd
	.long	1                               # 0x1
	.long	10                              # 0xa
	.long	6                               # 0x6
	.long	12                              # 0xc
	.long	11                              # 0xb
	.long	9                               # 0x9
	.long	5                               # 0x5
	.long	3                               # 0x3
	.long	8                               # 0x8
	.long	4                               # 0x4
	.long	1                               # 0x1
	.long	14                              # 0xe
	.long	8                               # 0x8
	.long	13                              # 0xd
	.long	6                               # 0x6
	.long	2                               # 0x2
	.long	11                              # 0xb
	.long	15                              # 0xf
	.long	12                              # 0xc
	.long	9                               # 0x9
	.long	7                               # 0x7
	.long	3                               # 0x3
	.long	10                              # 0xa
	.long	5                               # 0x5
	.long	0                               # 0x0
	.long	15                              # 0xf
	.long	12                              # 0xc
	.long	8                               # 0x8
	.long	2                               # 0x2
	.long	4                               # 0x4
	.long	9                               # 0x9
	.long	1                               # 0x1
	.long	7                               # 0x7
	.long	5                               # 0x5
	.long	11                              # 0xb
	.long	3                               # 0x3
	.long	14                              # 0xe
	.long	10                              # 0xa
	.long	0                               # 0x0
	.long	6                               # 0x6
	.long	13                              # 0xd
	.size	S, 256

	.type	.L.str.2,@object                # @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"shenlibo"
	.size	.L.str.2, 9

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"12345678"
	.size	.L.str.3, 9

	.section	.init_array,"aw",@init_array
	.p2align	3
	.quad	_GLOBAL__sub_I_desSample.cpp
	.ident	"Ubuntu clang version 14.0.0-1ubuntu1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _GLOBAL__sub_I_desSample.cpp
	.addrsig_sym _ZStL8__ioinit
	.addrsig_sym __dso_handle
