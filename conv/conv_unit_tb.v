`timescale 1ns / 1ps
`include "conv_unit.v"
// testbench for conv_unit.v

module conv_unit_testbench#(parameter WIDTH = 9);
reg clk;
reg rst_n;

reg [WIDTH-1:0] a0;
reg [WIDTH-1:0] a1;
reg [WIDTH-1:0] a2;
reg [WIDTH-1:0] a3;
reg [WIDTH-1:0] a4;
reg [WIDTH-1:0] a5;
reg [WIDTH-1:0] a6;
reg [WIDTH-1:0] a7;
reg [WIDTH-1:0] a8;

reg [WIDTH-1:0] b0;
reg [WIDTH-1:0] b1;
reg [WIDTH-1:0] b2;
reg [WIDTH-1:0] b3;
reg [WIDTH-1:0] b4;
reg [WIDTH-1:0] b5;
reg [WIDTH-1:0] b6;
reg [WIDTH-1:0] b7;
reg [WIDTH-1:0] b8;

wire [2 * WIDTH - 1:0] out;

initial
begin
    clk = 1'b0;
    rst_n = 1'b1;
    a0 = 0;  a1 = 1;  a2 = 2;  a3 = 3;  a4 = 4;  a5 = 5;  a6 = 6;  a7 = 7;  a8 = 8;
    b0 = 0;  b1 = 1;  b2 = 2;  b3 = 3;  b4 = 4;  b5 = 5;  b6 = 6;  b7 = 7;  b8 = 8;
end

always@(*)
begin
    #1
    clk <= ~clk;
end

//always@(posedge clk)
//begin
//end

conv_unit conv_unit_t(
                      .clk(clk),
                      .rst_n(rst_n),
                      .a00(a0),
                      .a01(a1),
                      .a02(a2),
                      .a10(a3),
                      .a11(a4),
                      .a12(a5),
                      .a20(a6),
                      .a21(a7),
                      .a22(a8),
                      .b00(b0),
                      .b01(b1),
                      .b02(b2),
                      .b10(b3),
                      .b11(b4),
                      .b12(b5),
                      .b20(b6),
                      .b21(b7),
                      .b22(b8),
                      .out(out)
);

endmodule