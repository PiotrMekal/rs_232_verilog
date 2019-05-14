`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:58 04/03/2019 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(
input wire clk_i,
input wire rst_i,
input wire RXD_i,
output wire TXD_o
    );
reg in2;
reg IN;
rs232 RS(clk_i, rst_i, IN, TXD_o);

always @(posedge clk_i)
begin
in2 <= RXD_i;
IN <= in2;
end
endmodule 