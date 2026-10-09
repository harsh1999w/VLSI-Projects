// 4:1 Mux design
// s=00 -> i0, s=01 -> i1, s=10 -> i2, s=11 -> i3

module mux_4to1(
  input [3:0] I,
  input [1:0] S,
  output reg Y
);

  always @(*)
  begin
    if(S == 2'b00)
      Y = I[0];
    else if(S == 2'b01)
      Y = I[1];
    else if(S == 2'b10)
      Y = I[2];
    else
      Y = I[3];
  end

endmodule
