# Test the RISC-V processor in simulation
# 待验证：LUI, AUIPC, ADDI

.globl sim1
sim1:
	lui 	x5, 0xF1F2F	
	auipc	x6, 0x6	
	addi	x0, x0, 1
	addi	x7, x0, 0x3F4
#ifdef TEST_ALL
    jalr x0, x1, 0
#endif
