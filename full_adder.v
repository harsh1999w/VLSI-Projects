
module full_adder(a, b, cin, sum, carry);
input a, b, cin;
output sum, carry;

assign sum = a ^ b ^ cin;
assign carry = (a & b) | (b & cin) | (a & cin);
endmodule

module tb;
reg a, b, cin;
wire sum, carry;

full_adder dut(a, b, cin, sum, carry);

initial begin
$dumpfile("dump.vcd");
$dumpvars;
a=0; b=0; cin=0; #10;
a=0; b=0; cin=1; #10;
a=0; b=1; cin=0; #10;
a=0; b=1; cin=1; #10;
a=1; b=0; cin=0; #10;
a=1; b=0; cin=1; #10;
a=1; b=1; cin=0; #10;
a=1; b=1; cin=1; #10;
$finish;
end
endmodule
