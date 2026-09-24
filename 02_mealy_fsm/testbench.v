module tb;
  reg clk;
  reg reset;
  reg in;
  wire detected;
  
  mealy_sequence_detector dut(
    
    .clk(clk),
    .reset(reset),
    .in(in),
    .detected(detected)
  );
  
  always #5 clk  = ~clk;
  
  initial begin
  
  $dumpfile("mealy_sequence_detector.vcd");
  $dumpvars(0,tb);
  $monitor("time = %0t, clk = %b, reset = %b, in = %b, detected = %b",
           $time, clk, reset, in, detected);
  end
  
  initial begin
    
    reset = 1;
    clk = 0;
    in = 1;
    #10;
    
    reset = 0;
    in = 1;
    #10;
    in = 0;
    #10;
    in = 1;
    #10;
    
    
    $finish;
    
  end
endmodule
