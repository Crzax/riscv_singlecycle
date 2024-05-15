# Test the RISC-V processor in simulation
# 已经能正确执行：LUI, ADDI
# 待验证：XORI, ANDI, SLLI

.globl sim2
sim2:	
        lui 	x5, 0xf5f5f
        xori	x6, x5, 0x70f
        andi	x7, x5, 0x70f
        slli    x8, x5, 4
#ifdef TEST_ALL
    jalr x0, x1, 0
#endif
