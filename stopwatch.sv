module stopwatch
(
    input clk,
    input reset,
    input start,
    input pfinish,
    input stop,
    output [6:0] hex0,
    output [6:0] hex1,
    output [6:0] hex2,
    output [6:0] hex3,
    output [6:0] hex4,
    output [6:0] hex5,
    output [9:0] led
);

    logic enable, sresult, chview, rview;
    logic pfinish_ff, stop_ff, blink;
    logic [3:0] num, cnt;
    logic clk_10ms;
    logic [23:0] data;
    logic [23:0] res_data;
    logic [23:0] disp_data;

    always_ff @(posedge clk)
    begin
        pfinish_ff <= pfinish;
        stop_ff <= stop;
    end

    fsm fsm
    (
        .clk(clk),
        .reset(reset),
        .start(start),
        .pfinish(pfinish & ~pfinish_ff),
        .stop(stop & ~stop_ff),
        .enable(enable),
        .sresult(sresult),
        .rview(rview),
        .num(num),
        .cnt(cnt)
    );

    clk_div cdiv (.clk(clk), .reset(reset), .enable(enable), .clk_10ms(clk_10ms));
    blinkgen bl (.clk(clk), .reset(reset), .blink(blink));

    view_led vl (.num(num), .cnt(cnt), .blink(blink), .rview(rview), .led(led));
    
    counters c (.clk(clk_10ms), .reset(reset), .enable(enable), .data(data));
    display d (.data(disp_data), .hex0(hex0), .hex1(hex1), .hex2(hex2), .hex3(hex3), .hex4(hex4), .hex5(hex5));

    res_mem rm (.clk(clk), .addr(cnt), .wrdata(data), .we(sresult), .rddata(res_data));

    assign disp_data = rview ? res_data : data;

endmodule: stopwatch