# Test the RISC-V processor in simulation
# 已经能正确执行：LUI, ADDI
# 待验证：ADD, XOR, AND, SLL

.globl sim3
sim3:	
        lui x5, 0x12345
		lui x6, 0xfffff
		addi x7, x0, 4
        add	x8, x5, x6
        xor	x9, x5, x6
        and	x10, x5, x6
        sll	x11, x5, x7
#ifdef TEST_ALL
    jalr x0, x1, 0
#endif
