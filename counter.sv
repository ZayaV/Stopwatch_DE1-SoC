module counter
#(
	parameter MAX_VAL = 4'd9
)
(
	input logic inc_cnt,
	input logic reset,
	input logic enable,
	output logic [3:0] cnt,
	output logic cout
);

	always_ff @(posedge inc_cnt, posedge reset)
		if (reset)
			begin
				cnt <= '0;
				cout <= '0;
			end
		else
			if (enable)
				if (cnt == MAX_VAL)
					begin
						cnt <= '0;
						cout <= '1;
					end
				else
					begin
						cnt <= cnt + 1'b1;
						cout <= '0;
					end

endmodule: counter