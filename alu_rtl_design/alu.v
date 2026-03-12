// Code your design here
//alu
module alu(
    input  [7:0] a,
    input  [7:0] b,
    input  [2:0] op,
    output reg [7:0] result,
    output zero
);

always @(*) begin
    case(op)
        3'b000: result = a + b;       // ADD
        3'b001: result = a - b;       // SUB
        3'b010: result = a & b;       // AND
        3'b011: result = a | b;       // OR
        3'b100: result = a ^ b;       // XOR
        3'b101: result = a << 1;      // SHIFT LEFT
        3'b110: result = a >> 1;      // SHIFT RIGHT
        3'b111: result = ~a;          // NOT
    endcase
end

assign zero = (result == 8'b0);

endmodule