module PE_event (
    input clk,
    input rst_n,
    input evt_valid,
    input [63:0] evt_data,
    output evt_ready,
    output reg psum_valid,
    output reg [31:0] psum,
    output reg [15:0] psum_idx
);
reg busy;
assign evt_ready = !busy;

always @(posedge clk) begin
    if (evt_valid && evt_ready) begin
        psum <= evt_data[63:48] * evt_data[47:32];
        psum_idx <= evt_data[15:0];
        psum_valid <= 1;
        busy <= 0;
    end else begin
        psum_valid <= 0;
    end
end
endmodule
