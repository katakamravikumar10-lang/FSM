module traffic_light_controller(
    input clk,
    input reset,
    output reg red_light,
    output reg green_light,
    output reg yellow_light
);

    localparam red    = 2'b00,
               green  = 2'b01,
               yellow = 2'b10;

    reg [1:0] state;
    reg [1:0] next_state;

    // 1. State Register
    always @(posedge clk or posedge reset) begin
        if(reset)
            state <= red;
        else
            state <= next_state;
    end

    // 2. Next-State Logic
    always @(*) begin
        case(state)

            red: begin
                next_state = green;
            end

            green: begin
                next_state = yellow;
            end

            yellow: begin
                next_state = red;
            end

            default: begin
                next_state = red;
            end

        endcase
    end

    // 3. Output Logic
    always @(*) begin
        case(state)

            red: begin
                red_light    = 1'b1;
                yellow_light = 1'b0;
                green_light  = 1'b0;
            end

            green: begin
                red_light    = 1'b0;
                yellow_light = 1'b0;
                green_light  = 1'b1;
            end

            yellow: begin
                red_light    = 1'b0;
                yellow_light = 1'b1;
                green_light  = 1'b0;
            end

            default: begin
                red_light    = 1'b1;
                yellow_light = 1'b0;
                green_light  = 1'b0;
            end

        endcase
    end

endmodule