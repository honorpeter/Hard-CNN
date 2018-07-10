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

    output [WIDTH - 1:0] out
);

// product
reg [2 * WIDTH - 1:0] p0;
reg [2 * WIDTH - 1:0] p1;
reg [2 * WIDTH - 1:0] p2;
reg [2 * WIDTH - 1:0] p3;
reg [2 * WIDTH - 1:0] p4;
reg [2 * WIDTH - 1:0] p5;
reg [2 * WIDTH - 1:0] p6;
reg [2 * WIDTH - 1:0] p7;
reg [2 * WIDTH - 1:0] p8;

reg [2 * WIDTH - 1:0] sum;
reg out_ready;
reg [2 * WIDTH - 1:0] out_buf;

initial 
begin 
p0 = 0; 
p1 = 0; 
p2 = 0; 
p3 = 0; 
p4 = 0; 
p5 = 0; 
p6 = 0; 
p7 = 0; 
p8 = 0;
sum = 0;
out_ready = 0;
out_buf = 0;
out = 0;
end

mul mul0(a00,b00,p0);
mul mul1(a01,b01,p1);
mul mul2(a02,b02,p2);
mul mul3(a10,b10,p3);
mul mul4(a11,b11,p4);
mul mul5(a12,b12,p5);
mul mul6(a20,b20,p6);
mul mul7(a21,b21,p7);
mul mul8(a22,b22,p8);

adder add0(p0,sum,out_buf);

adder_tree adder_tree0(p0,p1,p2,p3,p4,p5,p6,p7,p8,out_buf);

// out_ready信号控制是否可以输出   // 需要否?
assign out_ready = (clk_counter == 0)?(1):(0);
assign out = (out_ready == 1)?(out_buf):(0);

endmodule