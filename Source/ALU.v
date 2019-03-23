`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:24:43 01/13/2017 
// Design Name: 
// Module Name:    ALU 
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
module ALU
(
   input  [7:0] input_1,
   input  [7:0] input_2,
   input  [7:0] input_3,
   input  [1:0] op,
   output reg[7:0] output_1
);	

	always@(*) begin
	
		case (op)
	
			0: output_1 = input_1;
			
			1: output_1 = input_1 + input_3;
			
			2: output_1 = input_1 - input_2;
			
			default: output_1 = input_1;
			
		endcase
		
	end

endmodule
