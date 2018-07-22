`timescale 1ns / 1ps
// 3*32 shift register heap
/*
          r0[31]                                                         r0[0]
          +---+    +---+    +---+    +---+    +---+    +---+    +---+    +---+
     +--->+   +--->+   +--->+   +--->+   +--->+   +--->+   +--->+   +--->+   +----->
     |    +---+    +---+    +---+    +---+    +---+    +---+    +---+    +---+
     |
     +-----------------------------------------------------------------------------+
                                                                                   |
          +---+    +---+    +---+    +---+    +---+    +---+    +---+    +---+     |
     +--->+   +--->+   +--->+   +--->+   +--->+   +--->+   +--->+   +--->+   +-----+
     |    +---+    +---+    +---+    +---+    +---+    +---+    +---+    +---+
     |
     +-----------------------------------------------------------------------------+
                                                                                   |
          +---+    +---+    +---+    +---+    +---+    +---+    +---+    +---+     |
    ----->+   +--->+   +--->+   +--->+   +--->+   +--->+   +--->+   +--->+   +-----+
          +---+    +---+    +---+    +---+    +---+    +---+    +---+    +---+
          r2[31]                                                         r2[0]
*/

module shift_reg#(parameter WIDTH = 9)
(
    input clk,
    input rst_n,
    
    input [WIDTH-1:0] data_in,

    output [WIDTH-1:0] data_out0,
    output [WIDTH-1:0] data_out1,
    output [WIDTH-1:0] data_out2,
    output [WIDTH-1:0] data_out3,
    output [WIDTH-1:0] data_out4,
    output [WIDTH-1:0] data_out5,
    output [WIDTH-1:0] data_out6,
    output [WIDTH-1:0] data_out7,
    output [WIDTH-1:0] data_out8
);

//reg shift_enable;// 高进行移位，低不进行移位

reg [WIDTH-1:0] r0 [31:0];
reg [WIDTH-1:0] r1 [31:0];
reg [WIDTH-1:0] r2 [31:0];

// input logic
reg [WIDTH-1:0] input_buffer;
always@(posedge clk) input_buffer <= data_in;

// shift logic
always@(posedge clk)
begin
    //if(rst_n && shift_enable)
	if(rst_n)
    begin
        r0[0] = r0[1];     r0[1] = r0[2];     r0[2] = r0[3];     r0[3] = r0[4];
        r0[4] = r0[5];     r0[5] = r0[6];     r0[6] = r0[7];     r0[7] = r0[8];
        r0[8] = r0[9];     r0[9] = r0[10];    r0[10] = r0[11];   r0[11] = r0[12];
        r0[12] = r0[13];   r0[13] = r0[14];   r0[14] = r0[15];   r0[15] = r0[16];
        r0[16] = r0[17];   r0[17] = r0[18];   r0[18] = r0[19];   r0[19] = r0[20];
        r0[20] = r0[21];   r0[21] = r0[22];   r0[22] = r0[23];   r0[23] = r0[24];
        r0[24] = r0[25];   r0[25] = r0[26];   r0[26] = r0[27];   r0[27] = r0[28];
        r0[28] = r0[29];   r0[29] = r0[30];   r0[30] = r0[31];   r0[31] = r1[0];

        r1[0] = r1[1];     r1[1] = r1[2];     r1[2] = r1[3];     r1[3] = r1[4];
        r1[4] = r1[5];     r1[5] = r1[6];     r1[6] = r1[7];     r1[7] = r1[8];
        r1[8] = r1[9];     r1[9] = r1[10];    r1[10] = r1[11];   r1[11] = r1[12];
        r1[12] = r1[13];   r1[13] = r1[14];   r1[14] = r1[15];   r1[15] = r1[16];
        r1[16] = r1[17];   r1[17] = r1[18];   r1[18] = r1[19];   r1[19] = r1[20];
        r1[20] = r1[21];   r1[21] = r1[22];   r1[22] = r1[23];   r1[23] = r1[24];
        r1[24] = r1[25];   r1[25] = r1[26];   r1[26] = r1[27];   r1[27] = r1[28];
        r1[28] = r1[29];   r1[29] = r1[30];   r1[30] = r1[31];   r1[31] = r2[0];

        r2[0] = r2[1];     r2[1] = r2[2];     r2[2] = r2[3];     r2[3] = r2[4];
        r2[4] = r2[5];     r2[5] = r2[6];     r2[6] = r2[7];     r2[7] = r2[8];
        r2[8] = r2[9];     r2[9] = r2[10];    r2[10] = r2[11];   r2[11] = r2[12];
        r2[12] = r2[13];   r2[13] = r2[14];   r2[14] = r2[15];   r2[15] = r2[16];
        r2[16] = r2[17];   r2[17] = r2[18];   r2[18] = r2[19];   r2[19] = r2[20];
        r2[20] = r2[21];   r2[21] = r2[22];   r2[22] = r2[23];   r2[23] = r2[24];
        r2[24] = r2[25];   r2[25] = r2[26];   r2[26] = r2[27];   r2[27] = r2[28];
        r2[28] = r2[29];   r2[29] = r2[30];   r2[30] = r2[31];

        r2[31] = input_buffer;
    end
end

// output logic
wire [WIDTH-1:0] w0;
wire [WIDTH-1:0] w1;
wire [WIDTH-1:0] w2;
wire [WIDTH-1:0] w3;
wire [WIDTH-1:0] w4;
wire [WIDTH-1:0] w5;
wire [WIDTH-1:0] w6;
wire [WIDTH-1:0] w7;
wire [WIDTH-1:0] w8;
reg [9*WIDTH-1:0] out_buffer;

assign w0 = r0[0];
assign w1 = r0[1];
assign w2 = r0[2];
assign w3 = r1[0];
assign w4 = r1[1];
assign w5 = r1[2];
assign w6 = r2[0];
assign w7 = r2[1];
assign w8 = r2[2];

always@(*)
begin
	out_buffer = {w0,w1,w2,w3,w4,w5,w6,w7,w8};
end

assign {data_out0,data_out1,data_out2,data_out3,data_out4,data_out5,data_out6,data_out7,data_out8} = out_buffer;

endmodule