`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:36:36 01/13/2017 
// Design Name: 
// Module Name:    Comparator 
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
module Comparator
(
    input  [7:0] input_1,
    input  [7:0] input_2,
    output reg [7:0] result,
    output reg output_1,
    output reg output_2,
    output reg output_3
);

	always@(*) begin
	
		if(input_1 > input_2) begin
		
			result   = 0;
			output_1 = 1;
			output_2 = 0;
			output_3 = 0;
			
		end
		
		else if (input_1 == input_2) begin
			
			result   = input_1;
			output_1 = 0;
			output_2 = 1;
			output_3 = 0;
			
		end
		
		else begin
		
			result = 0;
			output_1 = 0;
			output_2 = 0;
			output_3 = 1;
			
		end
			
	end

endmodule
