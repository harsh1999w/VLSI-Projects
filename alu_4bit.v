module alu_4bit (
  input [3:0] A, B,
  input [1:0] Sel, // 00=ADD, 01=SUB, 10=AND, 11=OR
  output reg [3:0] Y,
  output reg Carry
);
always @(*) begin
  case(Sel)
    2'b00: {Carry, Y} = A + B;
    2'b01: {Carry, Y} = A - B;
    2'b10: begin Y = A & B; Carry=0; end
    2'b11: begin Y = A | B; Carry=0; end
    default: {Carry, Y} = 5'b0;
  endcase
end
endmodule
