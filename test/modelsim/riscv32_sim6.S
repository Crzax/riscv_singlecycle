# Test the RISC-V processor in simulation
# 已经能正确执行：ADDI, LUI, JALR
# 待验证：BEQ, BLT, BLTU

.globl sim6
sim6:   
        addi    x5, x0, 0               #x5 <== 0x0
#       lui     x6, 0x3                 #x6 <== 0x3000，在RARS上默认的起始地址为0x3000
                                        #在RARS上模拟时需要使用这句，注释掉下一句
        addi    x6, x0, %lo(sim6)               #x6 <== 0x0，在你自己的CPU上指令的起始地址为0
        lui     x7, 0xfffff             #x7 <== 0xFFFFF000

        beq     x5, x0, br1             #beq taken

br1ret: #instr 5
        beq     x7, x0, br1nxt          #beq not taken
        addi    x5, x5, 1               #x5 = 2

br1nxt: #instr 7
        blt     x7, x6, br2             #blt taken

br2ret: #instr 8
        blt     x6, x7, br2nxt          #blt not taken
        addi    x5, x5, 1               #x5 = 4

br2nxt: #instr 10
        bltu    x6, x7, br3             #bltu taken

br3ret: #instr 11
        bltu    x7, x6, br3nxt          #bltu not taken
        addi    x5, x5, 1               #x5 = 6

br3nxt: #instr 13
        jalr    x0, x6, 76              #x5 should be 0x6 for correct implementation

br1:    #instr 14
        addi    x5, x5, 1               #x5 = 1
        jalr    x0, x6, 16

br2:    #instr 16
        addi    x5, x5, 1               #x5 = 3
        jalr    x0, x6, 28

br3:    #instr 18
        addi    x5, x5, 1               #x5 = 5
        jalr    x0, x6, 40

end:    #instr 20
        add x0, x0, x0
#ifdef TEST_ALL
    jalr x0, x1, 0
#endif
