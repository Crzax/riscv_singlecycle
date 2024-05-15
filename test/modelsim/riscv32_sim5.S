# Test the RISC-V processor in simulation
# 已经能正确执行：ADDI
# 待验证：JAL, JALR

.globl sim5
sim5:   
#ifdef TEST_ALL
    sw x1, 0x200(x0)
#endif
        addi    x5, x0, 0               #x5 <== 0x0
        jal     x1, proc1               #call proc1
        addi    x5, x5, 1               #x5 <== 0x2
        jal     x0, end

proc1:
        addi    x5, x5, 1               #x5 <== 0x1
        jalr    x0, x1, 0

end:
#ifdef TEST_ALL
    lw x1, 0x200(x0)
    jalr x0, x1, 0
#endif
