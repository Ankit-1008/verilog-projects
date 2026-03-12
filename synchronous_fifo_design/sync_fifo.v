module fifo #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 16
)(
    input clk,
    input rst,

    input wr_en,
    input rd_en,

    input  [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out,

    output full,
    output empty
);

reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

reg [$clog2(DEPTH)-1:0] wr_ptr;
reg [$clog2(DEPTH)-1:0] rd_ptr;

reg [$clog2(DEPTH):0] count;

assign full  = (count == DEPTH);
assign empty = (count == 0);

always @(posedge clk or posedge rst)
begin
    if(rst)
        wr_ptr <= 0;
    else if(wr_en && !full)
        wr_ptr <= wr_ptr + 1;
end

always @(posedge clk or posedge rst)
begin
    if(rst)
        rd_ptr <= 0;
    else if(rd_en && !empty)
        rd_ptr <= rd_ptr + 1;
end

always @(posedge clk)
begin
    if(wr_en && !full)
        mem[wr_ptr] <= data_in;
end

always @(posedge clk)
begin
    if(rd_en && !empty)
        data_out <= mem[rd_ptr];
end

always @(posedge clk or posedge rst)
begin
    if(rst)
        count <= 0;
    else
    begin
        case({wr_en && !full, rd_en && !empty})
            2'b10: count <= count + 1;
            2'b01: count <= count - 1;
            default: count <= count;
        endcase
    end
end

endmodule