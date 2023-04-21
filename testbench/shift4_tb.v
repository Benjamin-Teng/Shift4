`include "../top/Shift4.v"

module Shift4_tb;

  // Parameters
  localparam size = 4;

  // Ports
  reg clk = 0;
  reg areset = 0;
  reg load = 0;
  reg ena = 0;
  reg [size - 1:0] data;
  wire [size - 1:0] q;

  Shift4 #(
      .size(size)
  ) Shift4_dut (
      .clk(clk),
      .areset(areset),
      .load(load),
      .ena(ena),
      .data(data),
      .q(q)
  );

  initial begin
    $dumpfile("shift_wave.vcd");
    $dumpvars;
    begin
      #10 areset = 1;
      #5 areset = 0;
      #5 data = 4'b1111;
      #5 ena = 1;
      #5 load = 1;
      #10 load = 0;
      #100;
      $finish;
    end
  end

  always #5 clk = !clk;

endmodule
