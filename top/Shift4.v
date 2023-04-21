module Shift4 #(
    parameter size = 4
) (
    input                   clk,
    input                   areset,  // async active-high reset to zero
    input                   load,
    input                   ena,
    input      [size - 1:0] data,
    output reg [size - 1:0] q
);

  always @(posedge clk or posedge areset) begin
    casez ({
      areset, load, ena
    })
      3'b1??:  q <= 4'b0000;
      3'b01?:  q <= data;
      3'b001:  q <= q >> 1;
      default: q <= q;
    endcase
  end

endmodule