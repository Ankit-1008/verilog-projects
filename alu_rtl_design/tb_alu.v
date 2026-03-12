// tb_alu
module tb_alu;

reg [7:0] a,b;
reg [2:0] op;
wire [7:0] result;
wire zero;

alu dut(a,b,op,result,zero);

initial begin

$display("Time\top\ta\tb\tresult\tzero");
$monitor("%0t\t%b\t%d\t%d\t%d\t%b",$time,op,a,b,result,zero);

a = 8'd10; 
b = 8'd5;

op = 3'b000; #10; // ADD
op = 3'b001; #10; // SUB
op = 3'b010; #10; // AND
op = 3'b011; #10; // OR
op = 3'b100; #10; // XOR
op = 3'b101; #10; // SHIFT LEFT
op = 3'b110; #10; // SHIFT RIGHT
op = 3'b111; #10; // NOT

$finish;

end

endmodule