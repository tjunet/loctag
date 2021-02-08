`timescale 1ns/1ns
module loctag_tb;
  reg clk;
  reg reset;
  reg trig;
  reg force_fs;
  reg [1:0] mode;


  initial begin
    clk <= 0;
    reset <= 1;
    trig <= 0;
    force_fs <= 0;
    mode <= 2'b10;
    #100
    reset <= 0;
    #9900
    trig <= 1;
  end

  always #10 clk <= ~clk;
  
  loctag loctag_inst (
    // 50MHz clock input
    clk,
    reset,
    lt5534_en,
    adc_cs,
    adc_clk,
    adc_so,
    trig,

    ctrl_1,

    force_fs,
    mode,
    led
  );

  

endmodule