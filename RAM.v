`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/19 13:56:46
// Design Name: 
// Module Name: RAM
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


module RAM(
    input clk,
    input reset,
    input write_en,
    input [2:0] add,
    input [7:0] write_data,
    output reg [7:0] read_data
);

reg [7:0] men [7:0];

always@(posedge clk) begin
    if(reset) begin
        men[0] <= 8'b0;
        men[1] <= 8'b0;
        men[2] <= 8'b0;
        men[3] <= 8'b0;
        men[4] <= 8'b0;
        men[5] <= 8'b0;
        men[6] <= 8'b0;
        men[7] <= 8'b0;
    end
    else begin
        if(write_en)
            men[add] <= write_data;
        else
            read_data <= men[add];
    end     
end
endmodule
