module vending_machine(
  
  input clk,
  input reset,
  input coin5,
  input coin10,
  output reg dispense,
  output reg change
);
  
  localparam s0 = 1'b0,
               s5 =1'b1;
  
  reg state;
  reg next_state;
  
  always @( posedge clk or posedge reset)
    
    begin
    
    if(reset)
      
      state <= s0;
  else 
    
    state <= next_state;
      
    end
  
 always @(*) begin
    case(state)

        s0: begin
            if(coin5)
                next_state = s5;
            else
                next_state = s0;
        end

        s5: begin
            if(coin5 || coin10)
                next_state = s0;
            else
                next_state = s5;
        end

        default: begin
            next_state = s0;
        end

    endcase
end
  
  // 3. Output Logic
always @(*) begin

    dispense = 1'b0;
    change   = 1'b0;

    case(state)

        s0: begin
            if(coin10) begin
                dispense = 1'b1;
                change   = 1'b0;
            end
        end

        s5: begin
            if(coin5) begin
                dispense = 1'b1;
                change   = 1'b0;
            end
            else if(coin10) begin
                dispense = 1'b1;
                change   = 1'b1;
            end
        end

        default: begin
            dispense = 1'b0;
            change   = 1'b0;
        end

    endcase

end
  
endmodule