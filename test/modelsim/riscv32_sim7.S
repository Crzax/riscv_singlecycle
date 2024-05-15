# Test the RISC-V processor in simulation
# 已验证：LUI, ADDI
# 待验证：SW, LW

.globl sim7
sim7:	
	lui 	x5, 0xF1F2F	
	addi	x6, x5, 0x3F4
		
	sw		x6, 0x200(x0)		
	lw		x7, 0x200(x0)
#ifdef TEST_ALL
    jalr x0, x1, 0
#endif
