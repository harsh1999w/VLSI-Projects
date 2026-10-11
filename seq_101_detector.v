// 101 Overlapping Sequence Detector using Mealy FSM
// Description: Detects overlapping 101 pattern

module seq_101_detector (
    input wire clk,
    input wire rst,
    input wire din,
    output reg dout
);

parameter S0 = 2'b00, // No bit detected
          S1 = 2'b01, // 1 detected
          S2 = 2'b10, // 10 detected
          S3 = 2'b11; // 101 detected

reg [1:0] current_state, next_state;

// State Register
always @(posedge clk or posedge rst) begin
    if (rst)
        current_state <= S0;
    else
        current_state <= next_state;
end

// Next State & Output Logic
always @(*) begin
    case (current_state)
        S0: begin
            dout = 0;
            if (din) next_state = S1;
            else next_state = S0;
        end
        S1: begin
            dout = 0;
            if (!din) next_state = S2;
            else next_state = S1;
        end
        S2: begin
            dout = 0;
            if (din) next_state = S3;
            else next_state = S0;
        end
        S3: begin
            dout = 1;
            if (din) next_state = S1;
            else next_state = S2;
        end
        default: begin
            next_state = S0;
            dout = 0;
        end
    endcase
end

endmodule
