module  elevator (
  
  input clk,
  input reset,
  input floor1,
  input floor2,
  input floor3,
  
  output reg up,
  output reg down,
  output reg at_floor
  
);
  
  localparam f1 = 2'b00,
            f2 = 2'b01,
            f3 = 2'b10;
  
  reg [1:0] state;
  reg [1:0] next_state;
  
  always@ (posedge clk or posedge reset)
    
    begin
      
      if (reset)
        
        state <= f1;
      else
        
        state <= next_state;
      
    end
  
  always@ (*)
    
    begin
      
      case(state)
        
        f1:begin
          
          if (floor1)
            
            next_state = f1;
         
          else if (floor2)
            
            next_state = f2;
          
          else if (floor3)
            
            next_state = f2;
          else
            
            next_state = f1;
        end
   
        
        f2:begin
          
          if(floor1)
            
            next_state = f1;
          
          else if (floor2)
            
            next_state = f2;
          
          else if (floor3)
             
            next_state = f3;
          else
            
            next_state = f2;
        end
        
        f3:begin
          
          if (floor1)
            
            next_state = f2;
          
          else if(floor2)
            
            next_state = f2;
          
          else if (floor3)
            
            next_state = f3;
          
          else 
            next_state = f3;
        end
          
          default: 
          
          next_state = f1;
            
            endcase
            
            end
  
  always@ (*)
    
    begin
    
    up = 1'b0;
    down = 1'b0;
    at_floor = 1'b0;
 
      
      case(state)
        
        f1:begin
          
          if (floor1)
            
            at_floor = 1'b1;
          
          else if(floor2 || floor3)
            
            up = 1'b1;
        end
        
        f2:begin
          
          if (floor1)
            
            down = 1'b1;
          
          else if (floor2)
            
            at_floor = 1'b1;
          else if(floor3)
            
            up = 1'b1;
          
        end
        
        f3:begin
          
          if(floor1 || floor2)
            
            down = 1'b1;
          
          else if (floor3)
            
            at_floor = 1'b1;
          
       end

        default: begin
            up = 1'b0;
            down = 1'b0;
            at_floor = 1'b0;
        end

    endcase

end
  
endmodule