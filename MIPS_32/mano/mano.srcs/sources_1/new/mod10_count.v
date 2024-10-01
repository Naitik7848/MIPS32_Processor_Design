`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2024 06:23:59 PM
// Design Name: 
// Module Name: mod10_count
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


module mod10_count(
    //input [3:0] data_in,
    input clk,
    input rst,
    output reg [3:0]data_out
    );

    always @(posedge clk)
    begin
        if(rst || data_out >= 9)
            begin
                data_out <= 4'b0000;
            end
        else data_out <= data_out + 1 ;
    end
endmodule
