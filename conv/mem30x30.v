`timescale 1ns / 1ps
// memory size 30*30

module mem30x30#(parameter WIDTH = 9)
(
    input clk,
    input rst_n,

    input rd_en,            // read enable
    input wr_en,            // write enable

    input [9:0] rdaddr,     // read address: [9:5] target memline + [4:0] mem address
    input [9:0] wraddr,     // write address: [9:5] target memline + [4:0] mem address

    input [WIDTH-1:0] data_in,

    output [WIDTH-1:0] data_out
);

// memory
reg [WIDTH-1:0] mem00 [29:0];
reg [WIDTH-1:0] mem01 [29:0];
reg [WIDTH-1:0] mem02 [29:0];
reg [WIDTH-1:0] mem03 [29:0];
reg [WIDTH-1:0] mem04 [29:0];
reg [WIDTH-1:0] mem05 [29:0];
reg [WIDTH-1:0] mem06 [29:0];
reg [WIDTH-1:0] mem07 [29:0];
reg [WIDTH-1:0] mem08 [29:0];
reg [WIDTH-1:0] mem09 [29:0];
reg [WIDTH-1:0] mem10 [29:0];
reg [WIDTH-1:0] mem11 [29:0];
reg [WIDTH-1:0] mem12 [29:0];
reg [WIDTH-1:0] mem13 [29:0];
reg [WIDTH-1:0] mem14 [29:0];
reg [WIDTH-1:0] mem15 [29:0];
reg [WIDTH-1:0] mem16 [29:0];
reg [WIDTH-1:0] mem17 [29:0];
reg [WIDTH-1:0] mem18 [29:0];
reg [WIDTH-1:0] mem19 [29:0];
reg [WIDTH-1:0] mem20 [29:0];
reg [WIDTH-1:0] mem21 [29:0];
reg [WIDTH-1:0] mem22 [29:0];
reg [WIDTH-1:0] mem23 [29:0];
reg [WIDTH-1:0] mem24 [29:0];
reg [WIDTH-1:0] mem25 [29:0];
reg [WIDTH-1:0] mem26 [29:0];
reg [WIDTH-1:0] mem27 [29:0];
reg [WIDTH-1:0] mem28 [29:0];
reg [WIDTH-1:0] mem29 [29:0];

// mem address line
wire [30*WIDTH-1:0] memline00;
wire [30*WIDTH-1:0] memline01;
wire [30*WIDTH-1:0] memline02;
wire [30*WIDTH-1:0] memline03;
wire [30*WIDTH-1:0] memline04;
wire [30*WIDTH-1:0] memline05;
wire [30*WIDTH-1:0] memline06;
wire [30*WIDTH-1:0] memline07;
wire [30*WIDTH-1:0] memline08;
wire [30*WIDTH-1:0] memline09;
wire [30*WIDTH-1:0] memline10;
wire [30*WIDTH-1:0] memline11;
wire [30*WIDTH-1:0] memline12;
wire [30*WIDTH-1:0] memline13;
wire [30*WIDTH-1:0] memline14;
wire [30*WIDTH-1:0] memline15;
wire [30*WIDTH-1:0] memline16;
wire [30*WIDTH-1:0] memline17;
wire [30*WIDTH-1:0] memline18;
wire [30*WIDTH-1:0] memline19;
wire [30*WIDTH-1:0] memline20;
wire [30*WIDTH-1:0] memline21;
wire [30*WIDTH-1:0] memline22;
wire [30*WIDTH-1:0] memline23;
wire [30*WIDTH-1:0] memline24;
wire [30*WIDTH-1:0] memline25;
wire [30*WIDTH-1:0] memline26;
wire [30*WIDTH-1:0] memline27;
wire [30*WIDTH-1:0] memline28;
wire [30*WIDTH-1:0] memline29;

assign memline00 = {mem00[0],mem00[1],mem00[2],mem00[3],mem00[4],mem00[5],mem00[6],mem00[7],mem00[8],mem00[9],mem00[10],mem00[11],mem00[12],mem00[13],mem00[14],mem00[15],mem00[16],mem00[17],mem00[18],mem00[19],mem00[20],mem00[21],mem00[22],mem00[23],mem00[24],mem00[25],mem00[26],mem00[27],mem00[28],mem00[29]};
assign memline01 = {mem01[0],mem01[1],mem01[2],mem01[3],mem01[4],mem01[5],mem01[6],mem01[7],mem01[8],mem01[9],mem01[10],mem01[11],mem01[12],mem01[13],mem01[14],mem01[15],mem01[16],mem01[17],mem01[18],mem01[19],mem01[20],mem01[21],mem01[22],mem01[23],mem01[24],mem01[25],mem01[26],mem01[27],mem01[28],mem01[29]};
assign memline02 = {mem02[0],mem02[1],mem02[2],mem02[3],mem02[4],mem02[5],mem02[6],mem02[7],mem02[8],mem02[9],mem02[10],mem02[11],mem02[12],mem02[13],mem02[14],mem02[15],mem02[16],mem02[17],mem02[18],mem02[19],mem02[20],mem02[21],mem02[22],mem02[23],mem02[24],mem02[25],mem02[26],mem02[27],mem02[28],mem02[29]};
assign memline03 = {mem03[0],mem03[1],mem03[2],mem03[3],mem03[4],mem03[5],mem03[6],mem03[7],mem03[8],mem03[9],mem03[10],mem03[11],mem03[12],mem03[13],mem03[14],mem03[15],mem03[16],mem03[17],mem03[18],mem03[19],mem03[20],mem03[21],mem03[22],mem03[23],mem03[24],mem03[25],mem03[26],mem03[27],mem03[28],mem03[29]};
assign memline04 = {mem04[0],mem04[1],mem04[2],mem04[3],mem04[4],mem04[5],mem04[6],mem04[7],mem04[8],mem04[9],mem04[10],mem04[11],mem04[12],mem04[13],mem04[14],mem04[15],mem04[16],mem04[17],mem04[18],mem04[19],mem04[20],mem04[21],mem04[22],mem04[23],mem04[24],mem04[25],mem04[26],mem04[27],mem04[28],mem04[29]};
assign memline05 = {mem05[0],mem05[1],mem05[2],mem05[3],mem05[4],mem05[5],mem05[6],mem05[7],mem05[8],mem05[9],mem05[10],mem05[11],mem05[12],mem05[13],mem05[14],mem05[15],mem05[16],mem05[17],mem05[18],mem05[19],mem05[20],mem05[21],mem05[22],mem05[23],mem05[24],mem05[25],mem05[26],mem05[27],mem05[28],mem05[29]};
assign memline06 = {mem06[0],mem06[1],mem06[2],mem06[3],mem06[4],mem06[5],mem06[6],mem06[7],mem06[8],mem06[9],mem06[10],mem06[11],mem06[12],mem06[13],mem06[14],mem06[15],mem06[16],mem06[17],mem06[18],mem06[19],mem06[20],mem06[21],mem06[22],mem06[23],mem06[24],mem06[25],mem06[26],mem06[27],mem06[28],mem06[29]};
assign memline07 = {mem07[0],mem07[1],mem07[2],mem07[3],mem07[4],mem07[5],mem07[6],mem07[7],mem07[8],mem07[9],mem07[10],mem07[11],mem07[12],mem07[13],mem07[14],mem07[15],mem07[16],mem07[17],mem07[18],mem07[19],mem07[20],mem07[21],mem07[22],mem07[23],mem07[24],mem07[25],mem07[26],mem07[27],mem07[28],mem07[29]};
assign memline08 = {mem08[0],mem08[1],mem08[2],mem08[3],mem08[4],mem08[5],mem08[6],mem08[7],mem08[8],mem08[9],mem08[10],mem08[11],mem08[12],mem08[13],mem08[14],mem08[15],mem08[16],mem08[17],mem08[18],mem08[19],mem08[20],mem08[21],mem08[22],mem08[23],mem08[24],mem08[25],mem08[26],mem08[27],mem08[28],mem08[29]};
assign memline09 = {mem09[0],mem09[1],mem09[2],mem09[3],mem09[4],mem09[5],mem09[6],mem09[7],mem09[8],mem09[9],mem09[10],mem09[11],mem09[12],mem09[13],mem09[14],mem09[15],mem09[16],mem09[17],mem09[18],mem09[19],mem09[20],mem09[21],mem09[22],mem09[23],mem09[24],mem09[25],mem09[26],mem09[27],mem09[28],mem09[29]};
assign memline10 = {mem10[0],mem10[1],mem10[2],mem10[3],mem10[4],mem10[5],mem10[6],mem10[7],mem10[8],mem10[9],mem10[10],mem10[11],mem10[12],mem10[13],mem10[14],mem10[15],mem10[16],mem10[17],mem10[18],mem10[19],mem10[20],mem10[21],mem10[22],mem10[23],mem10[24],mem10[25],mem10[26],mem10[27],mem10[28],mem10[29]};
assign memline11 = {mem11[0],mem11[1],mem11[2],mem11[3],mem11[4],mem11[5],mem11[6],mem11[7],mem11[8],mem11[9],mem11[10],mem11[11],mem11[12],mem11[13],mem11[14],mem11[15],mem11[16],mem11[17],mem11[18],mem11[19],mem11[20],mem11[21],mem11[22],mem11[23],mem11[24],mem11[25],mem11[26],mem11[27],mem11[28],mem11[29]};
assign memline12 = {mem12[0],mem12[1],mem12[2],mem12[3],mem12[4],mem12[5],mem12[6],mem12[7],mem12[8],mem12[9],mem12[10],mem12[11],mem12[12],mem12[13],mem12[14],mem12[15],mem12[16],mem12[17],mem12[18],mem12[19],mem12[20],mem12[21],mem12[22],mem12[23],mem12[24],mem12[25],mem12[26],mem12[27],mem12[28],mem12[29]};
assign memline13 = {mem13[0],mem13[1],mem13[2],mem13[3],mem13[4],mem13[5],mem13[6],mem13[7],mem13[8],mem13[9],mem13[10],mem13[11],mem13[12],mem13[13],mem13[14],mem13[15],mem13[16],mem13[17],mem13[18],mem13[19],mem13[20],mem13[21],mem13[22],mem13[23],mem13[24],mem13[25],mem13[26],mem13[27],mem13[28],mem13[29]};
assign memline14 = {mem14[0],mem14[1],mem14[2],mem14[3],mem14[4],mem14[5],mem14[6],mem14[7],mem14[8],mem14[9],mem14[10],mem14[11],mem14[12],mem14[13],mem14[14],mem14[15],mem14[16],mem14[17],mem14[18],mem14[19],mem14[20],mem14[21],mem14[22],mem14[23],mem14[24],mem14[25],mem14[26],mem14[27],mem14[28],mem14[29]};
assign memline15 = {mem15[0],mem15[1],mem15[2],mem15[3],mem15[4],mem15[5],mem15[6],mem15[7],mem15[8],mem15[9],mem15[10],mem15[11],mem15[12],mem15[13],mem15[14],mem15[15],mem15[16],mem15[17],mem15[18],mem15[19],mem15[20],mem15[21],mem15[22],mem15[23],mem15[24],mem15[25],mem15[26],mem15[27],mem15[28],mem15[29]};
assign memline16 = {mem16[0],mem16[1],mem16[2],mem16[3],mem16[4],mem16[5],mem16[6],mem16[7],mem16[8],mem16[9],mem16[10],mem16[11],mem16[12],mem16[13],mem16[14],mem16[15],mem16[16],mem16[17],mem16[18],mem16[19],mem16[20],mem16[21],mem16[22],mem16[23],mem16[24],mem16[25],mem16[26],mem16[27],mem16[28],mem16[29]};
assign memline17 = {mem17[0],mem17[1],mem17[2],mem17[3],mem17[4],mem17[5],mem17[6],mem17[7],mem17[8],mem17[9],mem17[10],mem17[11],mem17[12],mem17[13],mem17[14],mem17[15],mem17[16],mem17[17],mem17[18],mem17[19],mem17[20],mem17[21],mem17[22],mem17[23],mem17[24],mem17[25],mem17[26],mem17[27],mem17[28],mem17[29]};
assign memline18 = {mem18[0],mem18[1],mem18[2],mem18[3],mem18[4],mem18[5],mem18[6],mem18[7],mem18[8],mem18[9],mem18[10],mem18[11],mem18[12],mem18[13],mem18[14],mem18[15],mem18[16],mem18[17],mem18[18],mem18[19],mem18[20],mem18[21],mem18[22],mem18[23],mem18[24],mem18[25],mem18[26],mem18[27],mem18[28],mem18[29]};
assign memline19 = {mem19[0],mem19[1],mem19[2],mem19[3],mem19[4],mem19[5],mem19[6],mem19[7],mem19[8],mem19[9],mem19[10],mem19[11],mem19[12],mem19[13],mem19[14],mem19[15],mem19[16],mem19[17],mem19[18],mem19[19],mem19[20],mem19[21],mem19[22],mem19[23],mem19[24],mem19[25],mem19[26],mem19[27],mem19[28],mem19[29]};
assign memline20 = {mem20[0],mem20[1],mem20[2],mem20[3],mem20[4],mem20[5],mem20[6],mem20[7],mem20[8],mem20[9],mem20[10],mem20[11],mem20[12],mem20[13],mem20[14],mem20[15],mem20[16],mem20[17],mem20[18],mem20[19],mem20[20],mem20[21],mem20[22],mem20[23],mem20[24],mem20[25],mem20[26],mem20[27],mem20[28],mem20[29]};
assign memline21 = {mem21[0],mem21[1],mem21[2],mem21[3],mem21[4],mem21[5],mem21[6],mem21[7],mem21[8],mem21[9],mem21[10],mem21[11],mem21[12],mem21[13],mem21[14],mem21[15],mem21[16],mem21[17],mem21[18],mem21[19],mem21[20],mem21[21],mem21[22],mem21[23],mem21[24],mem21[25],mem21[26],mem21[27],mem21[28],mem21[29]};
assign memline22 = {mem22[0],mem22[1],mem22[2],mem22[3],mem22[4],mem22[5],mem22[6],mem22[7],mem22[8],mem22[9],mem22[10],mem22[11],mem22[12],mem22[13],mem22[14],mem22[15],mem22[16],mem22[17],mem22[18],mem22[19],mem22[20],mem22[21],mem22[22],mem22[23],mem22[24],mem22[25],mem22[26],mem22[27],mem22[28],mem22[29]};
assign memline23 = {mem23[0],mem23[1],mem23[2],mem23[3],mem23[4],mem23[5],mem23[6],mem23[7],mem23[8],mem23[9],mem23[10],mem23[11],mem23[12],mem23[13],mem23[14],mem23[15],mem23[16],mem23[17],mem23[18],mem23[19],mem23[20],mem23[21],mem23[22],mem23[23],mem23[24],mem23[25],mem23[26],mem23[27],mem23[28],mem23[29]};
assign memline24 = {mem24[0],mem24[1],mem24[2],mem24[3],mem24[4],mem24[5],mem24[6],mem24[7],mem24[8],mem24[9],mem24[10],mem24[11],mem24[12],mem24[13],mem24[14],mem24[15],mem24[16],mem24[17],mem24[18],mem24[19],mem24[20],mem24[21],mem24[22],mem24[23],mem24[24],mem24[25],mem24[26],mem24[27],mem24[28],mem24[29]};
assign memline25 = {mem25[0],mem25[1],mem25[2],mem25[3],mem25[4],mem25[5],mem25[6],mem25[7],mem25[8],mem25[9],mem25[10],mem25[11],mem25[12],mem25[13],mem25[14],mem25[15],mem25[16],mem25[17],mem25[18],mem25[19],mem25[20],mem25[21],mem25[22],mem25[23],mem25[24],mem25[25],mem25[26],mem25[27],mem25[28],mem25[29]};
assign memline26 = {mem26[0],mem26[1],mem26[2],mem26[3],mem26[4],mem26[5],mem26[6],mem26[7],mem26[8],mem26[9],mem26[10],mem26[11],mem26[12],mem26[13],mem26[14],mem26[15],mem26[16],mem26[17],mem26[18],mem26[19],mem26[20],mem26[21],mem26[22],mem26[23],mem26[24],mem26[25],mem26[26],mem26[27],mem26[28],mem26[29]};
assign memline27 = {mem27[0],mem27[1],mem27[2],mem27[3],mem27[4],mem27[5],mem27[6],mem27[7],mem27[8],mem27[9],mem27[10],mem27[11],mem27[12],mem27[13],mem27[14],mem27[15],mem27[16],mem27[17],mem27[18],mem27[19],mem27[20],mem27[21],mem27[22],mem27[23],mem27[24],mem27[25],mem27[26],mem27[27],mem27[28],mem27[29]};
assign memline28 = {mem28[0],mem28[1],mem28[2],mem28[3],mem28[4],mem28[5],mem28[6],mem28[7],mem28[8],mem28[9],mem28[10],mem28[11],mem28[12],mem28[13],mem28[14],mem28[15],mem28[16],mem28[17],mem28[18],mem28[19],mem28[20],mem28[21],mem28[22],mem28[23],mem28[24],mem28[25],mem28[26],mem28[27],mem28[28],mem28[29]};
assign memline29 = {mem29[0],mem29[1],mem29[2],mem29[3],mem29[4],mem29[5],mem29[6],mem29[7],mem29[8],mem29[9],mem29[10],mem29[11],mem29[12],mem29[13],mem29[14],mem29[15],mem29[16],mem29[17],mem29[18],mem29[19],mem29[20],mem29[21],mem29[22],mem29[23],mem29[24],mem29[25],mem29[26],mem29[27],mem29[28],mem29[29]};



/**********************************************************************************************************************/
/************************************************ READ & WRITE Logic **************************************************/
/**********************************************************************************************************************/
reg [4:0] target_line;
reg [4:0] addr;

initial
begin
    target_line = 5'b00000;
    addr = 5'b00000;
end

// resolve target line
always@(posedge clk)
begin
    if(rd_en) begin
        target_line <= rdaddr[9:5];
        addr <= rdaddr[4:0];
    end
    else if(wr_en) begin
        target_line <= wraddr[9:5];
        addr <= wraddr[4:0];
    end
    else begin
        target_line <= 5'b00000;
        addr <= 5'b00000;
    end
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n)
        data_out <= 0;
    else if(rd_en)
        case (target_line)
			0:  data_out <= memline00[WIDTH*addr+8:WIDTH*addr];
			1:  data_out <= memline01[WIDTH*addr+8:WIDTH*addr];
			2:  data_out <= memline02[WIDTH*addr+8:WIDTH*addr];
			3:  data_out <= memline03[WIDTH*addr+8:WIDTH*addr];
			4:  data_out <= memline04[WIDTH*addr+8:WIDTH*addr];
			5:  data_out <= memline05[WIDTH*addr+8:WIDTH*addr];
			6:  data_out <= memline06[WIDTH*addr+8:WIDTH*addr];
			7:  data_out <= memline07[WIDTH*addr+8:WIDTH*addr];
			8:  data_out <= memline08[WIDTH*addr+8:WIDTH*addr];
			9:  data_out <= memline09[WIDTH*addr+8:WIDTH*addr];
			10: data_out <= memline10[WIDTH*addr+8:WIDTH*addr];
			11: data_out <= memline11[WIDTH*addr+8:WIDTH*addr];
			12: data_out <= memline12[WIDTH*addr+8:WIDTH*addr];
			13: data_out <= memline13[WIDTH*addr+8:WIDTH*addr];
			14: data_out <= memline14[WIDTH*addr+8:WIDTH*addr];
			15: data_out <= memline15[WIDTH*addr+8:WIDTH*addr];
			16: data_out <= memline16[WIDTH*addr+8:WIDTH*addr];
			17: data_out <= memline17[WIDTH*addr+8:WIDTH*addr];
			18: data_out <= memline18[WIDTH*addr+8:WIDTH*addr];
			19: data_out <= memline19[WIDTH*addr+8:WIDTH*addr];
			20: data_out <= memline20[WIDTH*addr+8:WIDTH*addr];
			21: data_out <= memline21[WIDTH*addr+8:WIDTH*addr];
			22: data_out <= memline22[WIDTH*addr+8:WIDTH*addr];
			23: data_out <= memline23[WIDTH*addr+8:WIDTH*addr];
			24: data_out <= memline24[WIDTH*addr+8:WIDTH*addr];
			25: data_out <= memline25[WIDTH*addr+8:WIDTH*addr];
			26: data_out <= memline26[WIDTH*addr+8:WIDTH*addr];
			27: data_out <= memline27[WIDTH*addr+8:WIDTH*addr];
			28: data_out <= memline28[WIDTH*addr+8:WIDTH*addr];
			29: data_out <= memline29[WIDTH*addr+8:WIDTH*addr];
            //default:data_out <= 0;
        endcase
    else if(wr_en)
        case (target_line)
			0:  memline00[WIDTH*addr+8:WIDTH*addr] <= data_in;
			1:  memline01[WIDTH*addr+8:WIDTH*addr] <= data_in;
			2:  memline02[WIDTH*addr+8:WIDTH*addr] <= data_in;
			3:  memline03[WIDTH*addr+8:WIDTH*addr] <= data_in;
			4:  memline04[WIDTH*addr+8:WIDTH*addr] <= data_in;
			5:  memline05[WIDTH*addr+8:WIDTH*addr] <= data_in;
			6:  memline06[WIDTH*addr+8:WIDTH*addr] <= data_in;
			7:  memline07[WIDTH*addr+8:WIDTH*addr] <= data_in;
			8:  memline08[WIDTH*addr+8:WIDTH*addr] <= data_in;
			9:  memline09[WIDTH*addr+8:WIDTH*addr] <= data_in;
			10: memline10[WIDTH*addr+8:WIDTH*addr] <= data_in;
			11: memline11[WIDTH*addr+8:WIDTH*addr] <= data_in;
			12: memline12[WIDTH*addr+8:WIDTH*addr] <= data_in;
			13: memline13[WIDTH*addr+8:WIDTH*addr] <= data_in;
			14: memline14[WIDTH*addr+8:WIDTH*addr] <= data_in;
			15: memline15[WIDTH*addr+8:WIDTH*addr] <= data_in;
			16: memline16[WIDTH*addr+8:WIDTH*addr] <= data_in;
			17: memline17[WIDTH*addr+8:WIDTH*addr] <= data_in;
			18: memline18[WIDTH*addr+8:WIDTH*addr] <= data_in;
			19: memline19[WIDTH*addr+8:WIDTH*addr] <= data_in;
			20: memline20[WIDTH*addr+8:WIDTH*addr] <= data_in;
			21: memline21[WIDTH*addr+8:WIDTH*addr] <= data_in;
			22: memline22[WIDTH*addr+8:WIDTH*addr] <= data_in;
			23: memline23[WIDTH*addr+8:WIDTH*addr] <= data_in;
			24: memline24[WIDTH*addr+8:WIDTH*addr] <= data_in;
			25: memline25[WIDTH*addr+8:WIDTH*addr] <= data_in;
			26: memline26[WIDTH*addr+8:WIDTH*addr] <= data_in;
			27: memline27[WIDTH*addr+8:WIDTH*addr] <= data_in;
			28: memline28[WIDTH*addr+8:WIDTH*addr] <= data_in;
			29: memline29[WIDTH*addr+8:WIDTH*addr] <= data_in;
            //default:
        endcase
    else
        data_out <= 9'bz;//读写均无效时，为高阻态。若不加此句，时序会出现问题
end

endmodule