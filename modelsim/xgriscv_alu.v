`include "xgriscv_defines.v"

module alu_480( 
    input signed [31:0] 	A, B,  
    input [4:0]  			ALUOp, 
    input [31:0]   rom_addr,
    output reg signed [31:0] 	C, 
    output reg  		Zero
); 
       
always@(*)begin
        case(ALUOp)
            `ALUOp_lui: begin C = B + 0; Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_auipc:begin C = B + rom_addr;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_add: begin C = A + B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_sub: begin C = A - B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_bne: begin C = A - B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_blt:begin C = (A<B)?1'b1:1'b0;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_bge:begin C = (A>B)?1'b1:1'b0;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_bltu:begin C = ($unsigned(A) < $unsigned(B)) ? 1'b1:1'b0;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_bgeu:begin C = ($unsigned(A) >= $unsigned(B)) ? 1'b1:1'b0;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_slt: begin C = (A<B)?1'b1:1'b0; Zero = C==0 ? 1'b1 : 1'b0;end
            `ALUOp_sltu: begin C = ($unsigned(A)<$unsigned(B)) ? 1'b1:1'b0; Zero = C==0 ? 1'b1 : 1'b0;end
            `ALUOp_xor: begin C = A ^ B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_or:begin C = A | B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_and:begin C = A & B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_sll:begin C = A << B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_srl:begin C = A >> B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_sra:begin C = A >>> B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_slti: begin C = (A<B)?1'b1:1'b0; Zero = C==0 ? 1'b1 : 1'b0;end
            `ALUOp_sltiu: begin C = ($unsigned(A)<$unsigned(B))?1'b1:1'b0; Zero = C==0 ? 1'b1 : 1'b0;end
            default:C = 32'hFFFFFFFF;
        endcase
end
endmodule
