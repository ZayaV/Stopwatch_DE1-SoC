module counters
(
	input logic clk,
	input logic reset,
	input logic enable,
	output logic [23:0] data
);

	logic cout0, cout1, cout2, cout3, cout4, cout5;
		
	counter dc0 (.inc_cnt(clk), .reset(reset), .enable(enable), .cnt(data[3:0]), .cout(cout0));
	counter dc1 (.inc_cnt(cout0), .reset(reset), .enable(enable), .cnt(data[7:4]), .cout(cout1));
	counter dc2 (.inc_cnt(cout1), .reset(reset), .enable(enable), .cnt(data[11:8]), .cout(cout2));
	counter #(.MAX_VAL(4'd5)) dc3 (.inc_cnt(cout2), .reset(reset), .enable(enable), .cnt(data[15:12]), .cout(cout3));
    counter dc4 (.inc_cnt(cout3), .reset(reset), .enable(enable), .cnt(data[19:16]), .cout(cout4));
    counter #(.MAX_VAL(4'd5)) dc5 (.inc_cnt(cout4), .reset(reset), .enable(enable), .cnt(data[23:20]), .cout(cout5));
	
endmodule: counters