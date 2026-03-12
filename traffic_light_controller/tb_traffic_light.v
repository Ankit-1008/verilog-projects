// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module tb_traffic_light;

reg clk;
reg rst;

wire [2:0] north;
wire [2:0] east;

traffic_light_fsm dut(
    .clk(clk),
    .rst(rst),
    .north(north),
    .east(east)
);

// clock generation
always #5 clk = ~clk;

initial begin

// waveform generation
$dumpfile("traffic_light.vcd");
$dumpvars(0,tb_traffic_light);

// display header
$display("Time\tclk\trst\tnorth\teast");

// monitor signals
$monitor("%0t\t%b\t%b\t%b\t%b",$time,clk,rst,north,east);

clk = 0;
rst = 1;

#20 rst = 0;

#200 $finish;

end

endmodule