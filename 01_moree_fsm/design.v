module moore_fsm(
  
  input clk,
  input reset,
  input enable,
  output reg busy
);
  localparam idle = 2'b00,
               run  = 2'b01,
               done = 2'b10;

    reg [1:0] state;
    reg [1:0] next_state;
  
  always @(posedge clk or posedge reset)
    
    begin
      
      if(reset)
      state <= idle;
      
      else
        
        state <= next_state;
    end
  
  always @(*) begin
  
    case(state)
    
      idle:begin
      
        if(enable)
        
          next_state = run;
        
        else 
        
          next_state = idle;
          
      end
          
          run:begin
      
              next_state = done;
          
          end
      
      done:begin
      
          next_state = idle;
      
      end
      
      default:
    next_state = idle;
    
    endcase
  
  end
  
  always@(*) begin
    
    case(state)
      
      idle:busy = 1'b0;
      run:busy = 1'b1;
      done:busy = 1'b0;
     
      default:busy = 1'b0;
      
    endcase
  end
  
endmodule