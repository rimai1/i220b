#Currently get_cpuid(int *eax, int *ebx, int *ecx, int *edx).
#Modify to get_cpuid(int cpuid_op, int *eax, int *ebx, int *ecx, int *edx).	
	.text
	.globl get_cpuid
get_cpuid:
	pushq	%r11
	pushq	%r10
	pushq	%r9
	pushq	%r8
	pushq   %rcx
	pushq   %rdx
	pushq	%rsi
	pushq	%rdi
	
	cpuid
	
	#12-char manufacturer string in ebx, edx, ecx.
	movl	%eax, (%rdi)	#store eax cpuid result
	movl	%ebx, (%rsi)	#store ebx cpuid result
	popq	%rax		#pop address for edxP
	movl    %edx, (%rax)    #store edx cpuid result
	popq    %rax		#pop address for ecxP
	movl	%ecx, (%rax)	#store ecx cpuid result
	ret
	
