`timescale 1ns / 1ps
// convolution unit 3*3
// function: executing two 3*3 matrix convolution, get one summary

module conv_unit#(parameter WIDTH = 9)
(
    input clk,
    input rst_n,

    input [WIDTH - 1:0] a00, input [WIDTH - 1:0] a01, input [WIDTH - 1:0] a02,
    input [WIDTH - 1:0] a10, input [WIDTH - 1:0] a11, input [WIDTH - 1:0] a12,
    input [WIDTH - 1:0] a20, input [WIDTH - 1:0] a21, input [WIDTH - 1:0] a22,

    input [WIDTH - 1:0] b00, input [WIDTH - 1:0] b01, input [WIDTH - 1:0] b02,
    input [WIDTH - 1:0] b10, input [WIDTH - 1:0] b11, input [WIDTH - 1:0] b12,
    input [WIDTH - 1:0] b20, input [WIDTH - 1:0] b21, input [WIDTH - 1:0] b22,

    output [2 * WIDTH - 1:0] out
);

// product
wire [2 * WIDTH - 1:0] p0;
wire [2 * WIDTH - 1:0] p1;
wire [2 * WIDTH - 1:0] p2;
wire [2 * WIDTH - 1:0] p3;
wire [2 * WIDTH - 1:0] p4;
wire [2 * WIDTH - 1:0] p5;
wire [2 * WIDTH - 1:0] p6;
wire [2 * WIDTH - 1:0] p7;
wire [2 * WIDTH - 1:0] p8;

wire [2 * WIDTH - 1:0] out_buffer;

mul mul0(.a(a00),.b(b00),.out(p0));
mul mul1(.a(a01),.b(b01),.out(p1));
mul mul2(.a(a02),.b(b02),.out(p2));
mul mul3(.a(a10),.b(b10),.out(p3));
mul mul4(.a(a11),.b(b11),.out(p4));
mul mul5(.a(a12),.b(b12),.out(p5));
mul mul6(.a(a20),.b(b20),.out(p6));
mul mul7(.a(a21),.b(b21),.out(p7));
mul mul8(.a(a22),.b(b22),.out(p8));

adder_tree adder_tree0(.a0(p0),.a1(p1),.b0(p2),.b1(p3),.c0(p4),.c1(p5),.d0(p6),.d1(p7),.e(p8),.sum(out_buffer));

assign out = out_buffer;

endmodule