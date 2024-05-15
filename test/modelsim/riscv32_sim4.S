# Test the RISC-V processor in simulation
# 已经能正确执行：LUI, ADDI
# 待验证：SLT, SLTU, SLTI, SLTIU

.globl sim4
sim4:   
        lui     x5, 0xfffff             #x5 <== 0xFFFFF000
        lui     x6, 0xffffe             #x6 <== 0xFFFFE000
        slt     x7, x5, x6              #x7 <== 0x00000000
        slti    x8, x5, 1               #x8 <== 0x00000001
        sltu    x9, x5, x6              #x9 <== 0x00000000
        sltiu   x10, x5, -2048          #x10 <== 0x00000001
        sltiu   x11, x5, 1              #x11 <== 0x00000000
#ifdef TEST_ALL
    jalr x0, x1, 0
#endif
