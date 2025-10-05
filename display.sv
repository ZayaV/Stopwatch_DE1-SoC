module display
(
	input logic [23:0] data,
	output logic [6:0] hex0,
    output logic [6:0] hex1,
    output logic [6:0] hex2,
    output logic [6:0] hex3,
    output logic [6:0] hex4,
    output logic [6:0] hex5
);

	dig2seg ds1 (.dig(data[3:0]), .seg(hex0));
    dig2seg ds2 (.dig(data[7:4]), .seg(hex1));
    dig2seg ds3 (.dig(data[11:8]), .seg(hex2));
    dig2seg ds4 (.dig(data[15:12]), .seg(hex3));
    dig2seg ds5 (.dig(data[19:16]), .seg(hex4));
    dig2seg ds6 (.dig(data[23:20]), .seg(hex5));

endmodule: display