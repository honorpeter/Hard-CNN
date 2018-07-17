`timescale 1ns / 1ps
// ReLU unit for conv
// attention: only one number

module ReLU_unit#(parameter WIDTH = 9)
(
    input signed [2*WIDTH-1:0] in,
    output [2*WIDTH-1:0] out
);

reg [2*WIDTH-1:0] out_buffer;

always@(*)
begin
    if (in[2*WIDTH-1] == 1)
        out_buffer <= 0;
    else
        out_buffer <= in;
end

assign out = out_buffer;

endmodule