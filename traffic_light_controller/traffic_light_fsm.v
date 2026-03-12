module traffic_light_fsm(
    input clk,
    input rst,
    output reg [2:0] north,
    output reg [2:0] east
);

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

reg [1:0] state;

always @(posedge clk or posedge rst) begin
    if(rst)
        state <= S0;
    else
        state <= state + 1;
end

always @(*) begin

case(state)

S0: begin
north = 3'b001; // Green
east  = 3'b100; // Red
end

S1: begin
north = 3'b010; // Yellow
east  = 3'b100;
end

S2: begin
north = 3'b100;
east  = 3'b001;
end

S3: begin
north = 3'b100;
east  = 3'b010;
end

endcase

end

endmodule