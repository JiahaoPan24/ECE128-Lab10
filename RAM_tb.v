`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/19 14:07:14
// Design Name: 
// Module Name: RAM_tb
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


module RAM_tb();
reg clk, reset, write_en;
reg [2:0] add;
reg [7:0] write_data;
wire [7:0] read_data;

RAM uut(clk,reset,write_en,add,write_data,read_data);

always 
begin
    #5 clk = ~clk;
end

initial begin
    clk = 0;
    reset = 0;
    write_en = 1;
    
    #10 add = 3'b000; write_data = 1;
    #10 add = 3'b001; write_data = 2;
    #10 add = 3'b010; write_data = 3;
    #10 add = 3'b011; write_data = 4;
    
    #10 add = 3'b100; write_data = 5;
    #10 add = 3'b101; write_data = 6;
    #10 add = 3'b110; write_data = 7;
    #10 add = 3'b111; write_data = 8;
    
    #10 write_en = 0;
    
    #10 add = 3'b000;
    #10 add = 3'b001;
    #10 add = 3'b010;
    #10 add = 3'b011;
    
    #10 add = 3'b100;
    #10 add = 3'b101;
    #10 add = 3'b110;
    #10 add = 3'b111;
    
    #10 reset = 1;
    #10 reset = 0;
    
    #10 add = 3'b000;
    #10 add = 3'b001;
    #10 add = 3'b010;
    $stop;
end
endmodule
