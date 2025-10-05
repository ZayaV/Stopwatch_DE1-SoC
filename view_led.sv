module view_led
(
    input [3:0] num, cnt,
    input blink,
    input rview,
    output logic [9:0] led
);
    genvar i;
    generate
        for (i = 0; i < 10; i++)
        begin: ledassign
            assign led[i] = num > i ? (rview && (cnt == i) ? blink : '1) : '0;
        end
    endgenerate

endmodule: view_led