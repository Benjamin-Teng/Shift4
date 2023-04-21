module Shift4 #(
    parameter size = 4
) (
    input                    clk,
    input                    areset,  // async active-high reset to zero
    input                    load,
    input                    ena,
    input       [size - 1:0] data,
    output wire [size - 1:0] q
);

  reg [size - 1:0] q_drain = 4'b0000;

  always @(posedge clk or posedge areset) begin : _FSM
    if (areset) begin
      q_drain <= 4'b0000;
    end else begin
      if (load) begin
        q_drain <= data;
      end else if (ena) begin
        q_drain <= q >> 1;
      end else begin
        q_drain <= q;
      end
    end
  end

  assign q = q_drain;

endmodule
