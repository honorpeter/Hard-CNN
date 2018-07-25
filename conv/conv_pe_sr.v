`timescale 1ns / 1ps
// PE module with shift register
// 
module conv_pe_sr#(parameter WIDTH = 9)
(
    input clk,
    input rst_n,

    input [WIDTH-1:0] data_in,
    input [WIDTH-1:0] weight_in,
    output [2*WIDTH-1:0] data_out
);

reg [3:0] weight_counter;
reg [WIDTH-1:0] weight_buffer [8:0];

reg [6:0] clk_counter;

reg rst_n_cu;// conv_unit's rst_n

reg [2*WIDTH-1:0] out_debug;// debug

initial
begin
    weight_counter = 0;
    clk_counter = 0;
    rst_n_cu = 0;
    out_debug = 11;
end

// clk_counter 自增加
always@(posedge clk)
begin
    clk_counter <= clk_counter + 1;
end

// weight input logic
always@(posedge clk)
begin
    if(rst_n && weight_in)//???是否合理
    begin
        case (weight_counter)
            0: weight_buffer[0] <= weight_in;
            1: weight_buffer[1] <= weight_in;
            2: weight_buffer[2] <= weight_in;
            3: weight_buffer[3] <= weight_in;
            4: weight_buffer[4] <= weight_in;
            5: weight_buffer[5] <= weight_in;
            6: weight_buffer[6] <= weight_in;
            7: weight_buffer[7] <= weight_in;
            8: weight_buffer[8] <= weight_in;
            default: weight_counter <= 0;
        endcase
    end
end

// data input logic
wire [WIDTH-1:0] sr_out0;// sr: shift register
wire [WIDTH-1:0] sr_out1;
wire [WIDTH-1:0] sr_out2;
wire [WIDTH-1:0] sr_out3;
wire [WIDTH-1:0] sr_out4;
wire [WIDTH-1:0] sr_out5;
wire [WIDTH-1:0] sr_out6;
wire [WIDTH-1:0] sr_out7;
wire [WIDTH-1:0] sr_out8;

shift_reg sr0(.clk(clk),
              .rst_n(rst_n),
              .data_in(data_in),
              .data_out0(sr_out0),
              .data_out1(sr_out1),
              .data_out2(sr_out2),
              .data_out3(sr_out3),
              .data_out4(sr_out4),
              .data_out5(sr_out5),
              .data_out6(sr_out6),
              .data_out7(sr_out7),
              .data_out8(sr_out8));

// conv_unit's rst_n, 只有当sr中数据准备好之后才开始运算
always@(posedge clk)
begin
    if(rst_n)
    begin
        rst_n_cu <= (clk_counter < 97)? 0 : 1;
    end
end

// 运算部分
conv_unit cu0(.clk(clk),
              .rst_n(rst_n_cu),
              .a00(sr_out0),.a01(sr_out1),.a02(sr_out2),
              .a10(sr_out3),.a11(sr_out4),.a12(sr_out5),
              .a20(sr_out6),.a21(sr_out7),.a22(sr_out8),
              .b00(weight_buffer[0]),.b01(weight_buffer[1]),.b02(weight_buffer[2]),
              .b10(weight_buffer[3]),.b11(weight_buffer[4]),.b12(weight_buffer[5]),
              .b20(weight_buffer[6]),.b21(weight_buffer[7]),.b22(weight_buffer[8]),
              .out());

assign data_out = out_debug;

endmodule