`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/19 16:16:33
// Design Name: 
// Module Name: Multiplier
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


module Multiplier(
    input clk, reset,
    input [2:0] adr1,
    input [2:0] adr2,
    output [7:0] out
);

wire [3:0] rom_data;
wire [3:0] reg_a, reg_b;         
wire [7:0] product;               
wire [7:0] ram_read_data;         
wire [2:0] cu_st_out;            
wire cu_w_rf, cu_DA, cu_SA, cu_SB; 
wire [2:0] cu_adr, cu_w_ram;

cu c(
    .clk(clk),
    .reset(reset),
    .adr1(adr1),
    .adr2(adr2),
    .w_rf(cu_w_rf),
    .adr(cu_adr),
    .DA(cu_DA),
    .SA(cu_SA),
    .SB(cu_SB),
    .st_out(cu_st_out),
    .w_ram(cu_w_ram)
);

ROM rom (.ROM_data(rom_data), .ROM_addr(cu_adr));

Register r (
    .A(reg_a),
    .B(reg_b),
    .SA(cu_SA),
    .SB(cu_SB),
    .D(rom_data),
    .DA(cu_DA),
    .W(cu_w_rf),
    .rst(reset),
    .clk(clk)
);

C_Multiplier m (.a(reg_a), .b(reg_b), .p(product));

RAM ram (
    .clk(clk),
    .reset(reset),
    .write_en(cu_w_ram),
    .add(cu_adr),
    .write_data(product),
    .read_data(ram_read_data)
);

assign out = ram_read_data;

endmodule
