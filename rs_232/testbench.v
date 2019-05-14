`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:34:46 03/20/2019 
// Design Name: 
// Module Name:    testbench 
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
module testbench;
reg clk;
reg rst;
wire TXD;
reg RXD;

top top1(clk, rst,RXD, TXD);


initial

begin
clk=1;
RXD=1;
rst=1;
#100 rst=0;
#300 RXD=1;
#100 RXD=0;
#100  RXD=1;
#100  RXD=1;
#100  RXD=0;
#100  RXD=0;
#100  RXD=0;
#100  RXD=0;
#100  RXD=1;
#100  RXD=0;
#100  RXD=1;
end

always
#5 clk = ~clk;
endmodule
