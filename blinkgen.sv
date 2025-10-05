module blinkgen
(
    input clk,
    input reset,
    output logic blink
);

    logic [23:0] cnt = '0;

    always_ff @(posedge clk, posedge reset)
        if (reset)
            cnt <= '0;
        else
            cnt <= cnt + 1'b1;

    assign blink = cnt[23];

endmodule: blinkgen