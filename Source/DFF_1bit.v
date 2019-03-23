`timescale 1ns / 1ps

module DFF_1bit
(
	input  rst,
    input  clk,
    input  load,
    input  d,
    output reg q
);	
	 always @ (negedge clk or posedge rst)
	
	 if (rst)
	
		 q <= 0;
		
	 else if(load)
	
	  	 q <= d;

endmodule
