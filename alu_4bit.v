module alu_4bit(
 input [3:0] A, B,
 input [1:0] opcode,
 output reg [3:0] result,
 output reg carry
);
always @(*) begin
 case(opcode)
  2'b00: {carry, result} = A + B; // ADD
  2'b01: {carry, result} = A - B; // SUB
  2'b10: begin result = A & B; carry = 0; end // AND
  2'b11: begin result = A | B; carry = 0; end // OR
  default: begin result = 0; carry = 0; end
 endcase
end
endmodule
