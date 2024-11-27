`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/19 15:37:45
// Design Name: 
// Module Name: cu_tb
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


module cu_tb();
reg clk, reset;
reg [2:0] adr1;
reg [2:0] adr2;
wire w_rf;
wire [2:0] adr;
wire DA,SA,SB;
wire [2:0] st_out;
wire [2:0] w_ram;
cu uut(.clk(clk), .reset(reset), .adr1(adr1), .adr2(adr2), .w_rf(w_rf), .adr(adr), .DA(DA), .SA(SA), .SB(SB), .st_out(st_out), .w_ram(w_ram));

always 
begin
    #5 clk = ~clk;
end

initial begin
    clk = 0;
    reset = 0;
    adr1 = 1; 
    adr2 = 2;
    #10 reset = 1;
    #10 reset = 0;
    #100 reset = 1;
    #10 reset = 0;
    #100
    $stop;
    end
endmodule
