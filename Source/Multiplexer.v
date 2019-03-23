`timescale 1ns / 1ps

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
