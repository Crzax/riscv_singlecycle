`include "xgriscv_defines.v"
module NPC(PC, NPCOp, Zero,immout, NPC,aluout, ALUOp,rs1, pcW);  // next pc module
    input  [31:0] PC;        // pc
    input  [2:0]  NPCOp;     // 获得下一个PC地址的控制信号
    input  [31:0] immout;       // 立即数
    input [31:0] aluout;
    input [4:0] ALUOp;
    input Zero;
    input [4:0] rs1;

    output reg [31:0] NPC;   // next pc
    output [31:0] pcW;
   
    assign pcW = PC;
   
always@(*)begin
        begin 
                begin
                case(NPCOp)
                `NPC_PLUS4: NPC = PC +4;                            
                `NPC_BRANCH:begin 
                            case(ALUOp)
                            `ALUOp_sub:if(Zero==1) NPC =PC+immout; else NPC = PC +4;
                            `ALUOp_bne:if(Zero==0) NPC =PC+immout; else NPC = PC +4;
                            `ALUOp_blt:if(aluout==1) NPC =PC+immout; else NPC = PC +4;
                            `ALUOp_bge:if(aluout==1) NPC =PC+immout; else NPC = PC +4;
                            `ALUOp_bltu:if(aluout==1) NPC =PC+immout; else NPC = PC +4;
                            `ALUOp_bgeu:if(aluout==1) NPC =PC+immout; else NPC = PC +4;
                            default:NPC = PC +4;
                            endcase
                            end
                `NPC_JUMP:NPC = PC+immout; 
                `NPC_JALR: NPC = U_RF_480.rf[rs1]+immout;
                endcase
               end
        end
    end
//=================================================== 
   
endmodule