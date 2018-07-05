`timescale 1ns / 1ps
// multiplier for convolution unit

module mul#(parameter WIDTH = 9)
(
    input signed [WIDTH - 1 : 0] a,
	input signed [WIDTH - 1 : 0] b,
    
	output signed [2 * WIDTH -1 : 0] out
);

assign out = a * b;

endmodule
