`timescale 1ns / 1ps
// adder tree for convolution unit

module adder#(parameter WIDTH = 9)
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

    output reg signed[2 * WIDTH - 1:0] sum
);

// sum from level one
reg [2 * WIDTH - 1:0] s10;
reg [2 * WIDTH - 1:0] s11;
reg [2 * WIDTH - 1:0] s12;
reg [2 * WIDTH - 1:0] s13;
// sum for level two
reg [2 * WIDTH - 1:0] s20;
reg [2 * WIDTH - 1:0] s21;
// sum for level three
reg [2 * WIDTH - 1:0] s3;

initial
    s10 = 0;
    s11 = 0;
    s12 = 0;
    s13 = 0;

    s20 = 0;
    s21 = 0;

    s3 = 0;

    sum = 0;
end

adder adder_a(a0,a1,s10);
adder adder_b(b0,b1,s11);
adder adder_c(c0,c1,s12);
adder adder_d(d0,d1,s13);

adder adder_s20(s10,s11,s20);
adder adder_s21(s12,s13,s21);

adder adder_s3(s20,s21,s3);

adder adder_sum(s3,e,sum);

endmodule