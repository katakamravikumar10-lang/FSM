module mealy_sequence_detector(
    input clk,
    input reset,
    input in,
    output reg detected
);

    localparam s0 = 2'b00,
               s1 = 2'b01,
               s2 = 2'b10;

    reg [1:0] state;
    reg [1:0] next_state;

    // 1. State Register
    always @(posedge clk or posedge reset) begin
        if(reset)
            state <= s0;
        else
            state <= next_state;
    end

    // 2. Next-State Logic
    always @(*) begin
        case(state)

            s0: begin
                if(in)
                    next_state = s1;
                else
                    next_state = s0;
            end

            s1: begin
                if(in)
                    next_state = s1;
                else
                    next_state = s2;
            end

            s2: begin
                next_state = s0;
            end

            default: begin
                next_state = s0;
            end

        endcase
    end

    // 3. Output Logic
    always @(*) begin
        detected = 1'b0;

        if(state == s2 && in == 1'b1)
            detected = 1'b1;
    end

endmodule