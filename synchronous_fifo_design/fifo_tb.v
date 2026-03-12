`timescale 1ns/1ps

module tb_fifo;

reg clk = 0;
always #5 clk = ~clk;

reg rst;
reg wr_en;
reg rd_en;
reg [7:0] data_in;

wire [7:0] data_out;
wire full;
wire empty;

fifo uut(
.clk(clk),
.rst(rst),
.wr_en(wr_en),
.rd_en(rd_en),
.data_in(data_in),
.data_out(data_out),
.full(full),
.empty(empty)
);

initial
begin

// waveform generation
$dumpfile("fifo.vcd");
$dumpvars(0,tb_fifo);

// header
$display("Time\tclk\trst\twr_en\trd_en\tdata_in\tdata_out\tfull\tempty");

// monitor signals
$monitor("%0t\t%b\t%b\t%b\t%b\t%h\t%h\t%b\t%b",
$time,clk,rst,wr_en,rd_en,data_in,data_out,full,empty);

rst = 1;
wr_en = 0;
rd_en = 0;
data_in = 0;

#20 rst = 0;

// Write operations
#10 wr_en = 1; data_in = 8'hA1;
#10 data_in = 8'hB2;
#10 data_in = 8'hC3;

#10 wr_en = 0;

// Read operations
#20 rd_en = 1;

#50 $finish;

end

endmodule