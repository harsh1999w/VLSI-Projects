module seq_detector_101(clk, rst, din, dout);
input clk, rst, din;
output reg dout;
reg [1:0] state;

always @(posedge clk or posedge rst) begin
if (rst) begin
state <= 0;
dout <= 0;
end
else begin
case (state)
0: if (din) state <= 1;
1: if (!din) state <= 2;
2: if (din) state <= 3;
3: begin
dout <= 1;
if (din) state <= 1;
else state <= 2;
end
endcase
if (state != 3)
dout <= 0;
end
end
endmodule

module tb;
reg clk, rst, din;
wire dout;

seq_detector_101 dut(clk, rst, din, dout);

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
$dumpfile("dump.vcd");
$dumpvars;
rst = 1; #10;
rst = 0;
din = 1; #10;
din = 0; #10;
din = 1; #10;
din = 0; #10;
din = 1; #10;
$finish;
end
endmodule
