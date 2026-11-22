module mux_4to1(I, S, Y);
input [3:0] I;
input [1:0] S;
output reg Y;

always @(*) begin
case(S)
2'b00: Y = I[0];
2'b01: Y = I[1];
2'b10: Y = I[2];
2'b11: Y = I[3];
endcase
end
endmodule

module tb;
reg [3:0] I;
reg [1:0] S;
wire Y;

mux_4to1 dut(I, S, Y);

initial begin
$dumpfile("dump.vcd");
$dumpvars;
I = 4'b1010;
S = 2'b00; #10;
S = 2'b01; #10;
S = 2'b10; #10;
S = 2'b11; #10;
$finish;
end
endmodule
