module tb;
  
  reg clk;
  reg reset;
  wire red_light;
  wire green_light;
  wire yellow_light;
  
  traffic_light_controller dut (
    
    .clk(clk),
    .reset(reset),
    .red_light(red_light),
    .green_light(green_light),
    .yellow_light(yellow_light)
    
  );
  
 always #5 clk = ~clk;
  
  initial begin
    
    $dumpfile("traffic_light_controller.vcd");
    $dumpvars(0,tb);
    $monitor("time = %0t, clk = %b, reset = %b, red = %b, green = %b, yellow = %b",
             $time,clk,reset,red_light,green_light,yellow_light);
  end
  
  initial begin
    
    clk = 0;
    reset = 1;
    #10;
    
    reset = 0;
    
    #30;
    
    $finish;
    
  end
  
endmodule