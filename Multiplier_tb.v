`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/24 13:42:14
// Design Name: 
// Module Name: Multiplier_tb
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


module Multiplier_tb;

reg clk, reset;
reg [2:0] adr1, adr2;
wire [7:0] out;

Multiplier uut (.clk(clk), .reset(reset), .adr1(adr1), .adr2(adr2), .out(out));

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    adr1 = 3'd0;
    adr2 = 3'd0;

    #10;
    reset = 0;
    adr1 = 3'd1;
    adr2 = 3'd2;
    #100
    reset = 1;
    #10
    reset = 0;
    adr1 = 3'd4;
    adr2 = 3'd5;
    #100;
    reset = 1;
    #10
    reset = 0;
    adr1 = 3'd6;
    adr2 = 3'd7;
    #100;
    $stop;
end

endmodule
