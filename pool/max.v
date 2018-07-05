`timescale 1ns / 1ps
// compare 2 signed numbers to get the bigger one

module max#(parameter WIDTH = 9)
(
    input clk,
    input rst_n,

    input signed [WIDTH-1:0] a,
    input signed [WIDTH-1:0] b,

    output [WIDTH-1:0] max
);

initial
begin
    a = 0;
    b = 0;
    max = 0;
end

always@(posedge clk)
begin
    if (!rst_n)
    begin
        case ({a[WIDTH-1],b[WIDTH-1]})
            0:
                max <= ((a - b) > 0)?(a):(b);
            1:
                max <= a;
            2:
                max <= b;
            3:
                max <= ((a - b) > 0)?(b):(a);
        endcase
    end
end

endmodule