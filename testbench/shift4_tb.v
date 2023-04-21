`include "../top/Shift4.v"

module Shift4_tb;

  // Parameters
  localparam size = 4;

  // Ports
  reg               clk;
  reg               areset;
  reg               load;
  reg               ena;
  reg  [size - 1:0] data;
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
      clk = 1;
      areset = 0;
      load = 1;
      ena = 0;
      data = 4'b1111;
    end
    begin
      #9 load = 0;
      data = 'x;
      #10 ena = 1;
      #20 ena = 0;
      #55 areset = 1;
      #15 areset = 0;
      #50;
      $finish;
    end
  end

  always begin
    #5 clk = !clk;
  end

endmodule
