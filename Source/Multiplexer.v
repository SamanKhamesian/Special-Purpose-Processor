`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:07:15 01/13/2017 
// Design Name: 
// Module Name:    Multiplexer 
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
module Multiplexer
(
   input [7:0] input_1,
   input [7:0] input_2,
   input sel,
   output reg[7:0] output_1
);

	always@(*) begin
	
		if (sel == 0)
			output_1 = input_1;
		
		else
			output_1 = input_2;
	end

endmodule
