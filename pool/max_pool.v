`timescale 1ns / 1ps
// max pooling

module max_pool#(parameter WIDTH = 9)
(
    input clk,
    input rst_n,

    input signed [WIDTH-1:0] a00, input signed [WIDTH-1:0] a01,
    input signed [WIDTH-1:0] a10, input signed [WIDTH-1:0] a11,

    output [WIDTH-1:0] max
);

reg [WIDTH-1:0] max0;
reg [WIDTH-1:0] max1;

initial
begin
    max0 = 0;
    max1 = 0;
    max = 0;
end

max m0(clk,rst_n,a00,a01,max0);
max m1(clk,rst_n,a10,a11,max1);
max m2(clk,rst_n,max0,max1,max);

endmodule