`include "../top/Shift4.v"

module Shift4_tb;

  // Parameters
  localparam size = 4;

  // Ports
  reg clk = 1;
  reg areset = 0;
  reg load = 1;
  reg ena = 0;
  reg [size - 1:0] data = 4'b1111;
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
      #10 load = 0;
      data = 'x;
      #10 ena = 1; #20 ena = 0;
      #55 areset = 1; #15 areset = 0;
      #50;
      $finish;
    end
  end

  always begin
    #5 clk = !clk;
  end

endmodule
