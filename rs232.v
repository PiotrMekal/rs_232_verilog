`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:24 04/03/2019 
// Design Name: 
// Module Name:    rs232 
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
module rs232(
input wire clk_i,
input wire rst_i,
input wire RXD_i,
output reg TXD_o
    );
reg [2:0] control=3'b0;//kontrola przesy³u 
reg [0:7] data;

parameter N=32'd10; //5208;//50000000/9600;
reg [31:0] cntr = 32'b0;


always @(posedge rst_i or posedge clk_i)
begin
	if(rst_i)
		begin
			data <=8'b0;
			control <=3'b0;
			TXD_o <=1'b1;
		end
	else 
		if(control == 3'b000 && RXD_i == 0)
			begin
				control <= 3'b001;
				cntr <= 32'b0;
			end
		else 
			if(control == 3'b000)
			begin
				TXD_o <= 1'b1;
				end
			else 
				if(control == 3'b001) //odczyt
					begin
						cntr <= cntr+1;
							case (cntr)
						  N+2: data[0] <= RXD_i;
						2*N+2: data[1] <= RXD_i; 
						3*N+2: data[2] <= RXD_i; 
						4*N+2: data[3] <= RXD_i; 
						5*N+2: data[4] <= RXD_i; 
						6*N+2: data[5] <= RXD_i; 
						7*N+2: data[6] <= RXD_i; 
						8*N+2:
							begin
								data[7] <= RXD_i; 
								control <= 3'b010;
							end
						//default:
					endcase
			end
		else if(control == 3'b010) //dodanie h20
			begin
					if (data[5] == 0)
						data[5] <= 1'b1;
						else if(data[5] == 1 && data[6] == 0)
							begin
								data[5] <= 1'b0;
								data[6] <= 1'b1;
							end
							else if (data[5] == 1 && data[6] == 1 && data[7] == 0)
								begin
									data[5] <= 1'b0;
									data[6] <= 1'b0;
									data[7] <= 1'b1;
								end	
									else
									 data <= 8'b11111111;
						
				control <= 3'b011;
				cntr <= cntr+1;
			end
		else if(control == 3'b011) // wyzerowanie licznika
			begin
				cntr <= 32'b0;
				control <= 3'b100;
			end
		else if(control == 3'b100) //transmisja
			begin
			cntr <= cntr+1;
				case (cntr)
						    2: TXD_o <=1'b0;
						  N+2: TXD_o <= data[0];
						2*N+2: TXD_o <= data[1];
						3*N+2: TXD_o <= data[2];
						4*N+2: TXD_o <= data[3];
						5*N+2: TXD_o <= data[4];
						6*N+2: TXD_o <= data[5];
						7*N+2: TXD_o <= data[6];
						8*N+2: TXD_o <= data[7];
						9*N+2:
							begin
								TXD_o <= 1'b1;
								control <= 3'b000;
							end
						//default:
					endcase
			end
		
			
		end
endmodule 