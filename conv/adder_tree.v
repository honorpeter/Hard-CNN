`timescale 1ns / 1ps
// adder tree for convolution unit

module adder_tree#(parameter WIDTH = 9)
(
    input signed [2 * WIDTH - 1:0] a0,
    input signed [2 * WIDTH - 1:0] a1,
    input signed [2 * WIDTH - 1:0] b0,
    input signed [2 * WIDTH - 1:0] b1,
    input signed [2 * WIDTH - 1:0] c0,
    input signed [2 * WIDTH - 1:0] c1,
    input signed [2 * WIDTH - 1:0] d0,
    input signed [2 * WIDTH - 1:0] d1,
    input signed [2 * WIDTH - 1:0] e,

    output signed[2 * WIDTH - 1:0] sum
);

// sum from level one
wire [2 * WIDTH - 1:0] s10;
wire [2 * WIDTH - 1:0] s11;
wire [2 * WIDTH - 1:0] s12;
wire [2 * WIDTH - 1:0] s13;
// sum for level two
wire [2 * WIDTH - 1:0] s20;
wire [2 * WIDTH - 1:0] s21;
// sum for level three
wire [2 * WIDTH - 1:0] s3;

wire [2*WIDTH - 1:0] out_buffer;

adder adder_a(.a(a0),.b(a1),.out(s10));
adder adder_b(.a(b0),.b(b1),.out(s11));
adder adder_c(.a(c0),.b(c1),.out(s12));
adder adder_d(.a(d0),.b(d1),.out(s13));

adder adder_s20(.a(s10),.b(s11),.out(s20));
adder adder_s21(.a(s12),.b(s13),.out(s21));

adder adder_s3(.a(s20),.b(s21),.out(s3));

adder adder_sum(.a(s3),.b(e),.out(out_buffer));

assign sum = out_buffer;

endmodule