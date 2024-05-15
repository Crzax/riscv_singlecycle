`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/04 16:04:27
// Design Name: 
// Module Name: seg7x16_361
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seg7x16_480(
input clk,
input rstn,
input disp_mode,    //ͼ��/�ַ�
input [63:0] i_data,
output  [7:0] o_seg,
output  [7:0] o_sel
    );
reg [14:0] cnt; 
wire seg7_clk;

always @(posedge clk or negedge rstn) begin
    if (!rstn) cnt <= 0; 
    else cnt <= cnt + 1'b1; 
end

assign seg7_clk = cnt[14]; //15��Ƶ
reg [2:0] seg7_addr;    //Ҫ�����Ǹ�����ܵ�ַ

always @(posedge seg7_clk or negedge rstn) begin
    if (!rstn) seg7_addr <= 0; 
    else seg7_addr <= seg7_addr + 1'b1; 
end
reg [7:0] o_sel_r; //Ҫ��������ܵ�������

always @(*) begin 
    case(seg7_addr) 
        7: o_sel_r = 8'b01111111; 
        6: o_sel_r = 8'b10111111; 
        5: o_sel_r = 8'b11011111; 
        4: o_sel_r = 8'b11101111; 
        3: o_sel_r = 8'b11110111; 
        2: o_sel_r = 8'b11111011; 
        1: o_sel_r = 8'b11111101; 
        0: o_sel_r = 8'b11111110; 
    endcase
end
reg [63:0] i_data_store;    //��������ݣ�ÿ��λ��һ������ܵ���ʾ
reg [7:0] seg_data_r;   //����ܵ���ʾ���ݣ���δ���룩
always @(posedge clk, negedge rstn)
    if(!rstn) 
        i_data_store <= 0; 
    else
        i_data_store <= i_data;     //�˸�����ܵ��ַ���/ͼ��
always @(*)
    if(disp_mode == 1'b0) 
        begin 
            case(seg7_addr)     //�ַ�ģʽ
                0: seg_data_r = i_data_store[3:0];
                1: seg_data_r = i_data_store[7:4];
                2: seg_data_r = i_data_store[11:8];
                3: seg_data_r = i_data_store[15:12];
                4: seg_data_r = i_data_store[19:16];
                5: seg_data_r = i_data_store[23:20];
                6: seg_data_r = i_data_store[27:24];
                7: seg_data_r = i_data_store[31:28];
            endcase
        end 
    else 
        begin 
            case(seg7_addr)     //ͼ��ģʽ
                0: seg_data_r = i_data_store[7:0];
                1: seg_data_r = i_data_store[15:8];
                2: seg_data_r = i_data_store[23:16];
                3: seg_data_r = i_data_store[31:24];
                4: seg_data_r = i_data_store[39:32];
                5: seg_data_r = i_data_store[47:40];
                6: seg_data_r = i_data_store[55:48];
                7: seg_data_r = i_data_store[63:56];
            endcase
        end

reg [7:0] o_seg_r; //��������ܵľ������������

always @(posedge clk, negedge rstn)
    if(!rstn) 
        o_seg_r <= 8'hff; 
    else if(disp_mode == 1'b0) 
        begin
            case(seg_data_r)    //���룬�߶���Ҫ��ʾ�����֣��ַ�ģʽ
                4'h0: o_seg_r <= 8'hC0; 
                4'h1: o_seg_r <= 8'hF9; 
                4'h2: o_seg_r <= 8'hA4; 
                4'h3: o_seg_r <= 8'hB0; 
                4'h4: o_seg_r <= 8'h99; 
                4'h5: o_seg_r <= 8'h92; 
                4'h6: o_seg_r <= 8'h82; 
                4'h7: o_seg_r <= 8'hF8; 
                4'h8: o_seg_r <= 8'h80; 
                4'h9: o_seg_r <= 8'h90; 
                4'hA: o_seg_r <= 8'h88; 
                4'hB: o_seg_r <= 8'h83; 
                4'hC: o_seg_r <= 8'hC6; 
                4'hD: o_seg_r <= 8'hA1; 
                4'hE: o_seg_r <= 8'h86; 
                4'hF: o_seg_r <= 8'h8E; 
                default: o_seg_r <= 8'hFF;
            endcase
        end 
    else 
        begin 
            o_seg_r <= seg_data_r;  //ͼ��ģʽ
        end 

assign o_sel = o_sel_r;
assign o_seg = o_seg_r;

endmodule