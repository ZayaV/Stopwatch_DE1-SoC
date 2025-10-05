module clk_div
(
	input logic clk, reset, enable,
	output logic clk_10ms
);

	localparam T10MS = 19'd499_999;
	
	logic [18:0] cnt = 19'b0;
	
	always_ff @(posedge clk, posedge reset)
        if (reset)
            begin
				cnt <= '0;
				clk_10ms <= '0;
			end
        else
            if (enable)
                if (cnt == T10MS)
                    begin
                        cnt <= '0;
                        clk_10ms <= '1;
                    end
                else
                    begin
                        cnt <= cnt + 1'b1;
                        clk_10ms <= '0;
                    end

endmodule: clk_div