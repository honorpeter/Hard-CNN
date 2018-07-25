`timescale 1ns / 1ps
// multiplier for convolution unit

module mul#(parameter WIDTH = 9)
(
	input clk,
	input rst_n,
    input signed [WIDTH - 1 : 0] a,
	input signed [WIDTH - 1 : 0] b,
    
	output wire signed [2 * WIDTH -1 : 0] out
);

reg [2 * WIDTH -1 : 0] product;

always@(posedge clk)
begin
	if(rst_n)
		product <= a * b;
end

assign out = product;

endmodule
