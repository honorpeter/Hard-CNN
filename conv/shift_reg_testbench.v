`timescale 1ns / 1ps
`include "shift_reg.v"
// testbench for shift_reg.v
module shift_reg_testbench#(parameter WIDTH = 9);

reg clk;
reg rst_n;
reg [WIDTH-1:0] data_in;

wire [WIDTH-1:0] data_out0;
wire [WIDTH-1:0] data_out1;
wire [WIDTH-1:0] data_out2;
wire [WIDTH-1:0] data_out3;
wire [WIDTH-1:0] data_out4;
wire [WIDTH-1:0] data_out5;
wire [WIDTH-1:0] data_out6;
wire [WIDTH-1:0] data_out7;
wire [WIDTH-1:0] data_out8;

initial
begin
       clk = 1'b0;
       rst_n = 1'b1;
       data_in = 0;
end

always@(*)
begin
    #1
    clk <= ~clk;
end

always@(posedge clk)
begin
    data_in <= (data_in < 96)?(data_in + 1):0;
end

shift_reg shift_reg_t(
                      .clk(clk),
                      .rst_n(rst_n),
                      .data_in(data_in),
                      .data_out0(data_out0),
                      .data_out1(data_out1),
                      .data_out2(data_out2),
                      .data_out3(data_out3),
                      .data_out4(data_out4),
                      .data_out5(data_out5),
                      .data_out6(data_out6),
                      .data_out7(data_out7),
                      .data_out8(data_out8)
                      );

endmodule