module dig2seg
(
	input logic [3:0] dig,
	output logic [6:0] seg
);

	always_comb
		begin
			case (dig)
				4'd0: seg[6:0] = ~7'b0111111;
				4'd1: seg[6:0] = ~7'b0000110;
				4'd2: seg[6:0] = ~7'b1011011;
				4'd3: seg[6:0] = ~7'b1001111;
				4'd4: seg[6:0] = ~7'b1100110;
				4'd5: seg[6:0] = ~7'b1101101;
				4'd6: seg[6:0] = ~7'b1111101;
				4'd7: seg[6:0] = ~7'b0000111;
				4'd8: seg[6:0] = ~7'b1111111;
				4'd9: seg[6:0] = ~7'b1101111;
				default: seg[6:0] = 7'h7F;
			endcase
		end

endmodule: dig2seg