`timescale 1ns / 1ps

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
