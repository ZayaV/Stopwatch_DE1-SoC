module res_mem
(
    input clk,
    input [3:0] addr,
    input [23:0] wrdata,
    input we,
    output [23:0] rddata
);

    logic [23:0] data [0:9];

    always_ff @(posedge clk)
        if (we)
            data[addr] <= wrdata;

    assign rddata = data[addr];

endmodule: res_mem