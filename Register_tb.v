`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/19 14:44:35
// Design Name: 
// Module Name: Register_tb
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


module Register_tb();
reg W;
reg [3:0] D;
reg DA;
reg SA;
reg SB;
reg clk;
reg rst;
wire [3:0] A, B;

Register uut(A, B, SA, SB, D, DA, W, rst, clk);

always 
begin
    #5 clk = ~clk;
end

initial begin
    clk = 0;
    rst = 0;
    W = 0;
    SA = 0;
    SB = 0;
    
    #10 W = 1;
    #10 DA = 0; D = 3;
    #10 DA = 1; D = 5;
    #10 W = 0;
    #10 DA = 0; D = 1;
    #10 DA = 1; D = 2;
    
    #10 SA = 1;SB = 1;
    #10 rst = 1;
    #20
   $stop;
   end
endmodule
