module half_adder(a, b, sum, carry);
input a, b;
output sum, carry;

assign sum = a ^ b;
assign carry = a & b;
endmodule

module tb;
reg a, b;
wire sum, carry;

half_adder dut(a, b, sum, carry);

initial begin
$dumpfile("dump.vcd");
$dumpvars;
a=0; b=0; #10;
a=0; b=1; #10;
a=1; b=0; #10;
a=1; b=1; #10;
$finish;
end
endmodule
