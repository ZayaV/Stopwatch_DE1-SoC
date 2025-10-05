module fsm
(
    input clk, reset,
    input start,
    input pfinish,
    input stop,
	output logic enable,
    output logic sresult,
    output logic rview,
    output logic [3:0] num,
    output logic [3:0] cnt
);
	
	import fsm_pkg::*;
	state_e state, next;

    always_ff @(posedge clk, posedge reset)
        if (reset)
            state <= IDLE;
        else
            state <= next;

    always_comb
    begin
        next = XXX;
        case (state)
            IDLE:       if (start)      next = START;
                        else            next = IDLE;

            START:      if ((pfinish && (num == 4'd9)) || stop)
                                        next = VIEW;
                        else            next = START;

            VIEW:       if (pfinish || stop)
                                        next = NVIEW;
                        else            next = VIEW;

            NVIEW:                      next = VIEW;

            default:                    next = XXX;
        endcase
    end

    always_ff @(posedge clk, posedge reset)
        if (reset)
        begin
            enable <= '0;
            sresult <= '0;
            rview <= '0;
            num <= '0;
            cnt <= '0;
        end
        else
        begin
			enable <= '0;
            sresult <= '0;
            rview <= '0;
			case (next)
				IDLE:		if (start)		    enable <= '1;

				START:		if (pfinish && num < 4'd9)
                                            begin
                                                sresult <= '1;
                                                cnt <= num;
								                num <= num + 1'b1;
                                                enable <= '1;
                                            end
                            else                enable <= '1;
                            
                VIEW:       if ((pfinish && num == 4'd9) || stop)
                                            begin
                                                sresult <= '1;
                                                cnt <= num;
                                                num <= num + 1'b1;
                                                rview <= '1;
                                            end
                            else                rview <= '1;

                NVIEW:      if (pfinish)    begin
                                                if (cnt == num - 1'b1)
                                                    cnt <= '0;
                                                else
                                                    cnt <= cnt + 1'b1;
                                                rview <= '1;
                                            end
                            else if (stop)  begin
                                                if (cnt == '0)
                                                    cnt <= num - 1'b1;
                                                else
                                                    cnt <= cnt - 1'b1;
                                                rview <= '1;
                                            end

			endcase
		end

endmodule: fsm