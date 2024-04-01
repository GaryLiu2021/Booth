module compressor32 #(
    parameter WIDTH = 32
)(
    input   [WIDTH-1:0]     x0,
    input   [WIDTH-1:0]     x1,
    input   [WIDTH-1:0]     x2,

    output  [WIDTH-1:0]     cout,
    output  [WIDTH-1:0]     sum
);

    genvar i;
    generate
        for(i = 0;i < WIDTH; i = i + 1) begin: CELLS
            compressor32_cell u_compressor32_cell(
                .x0                 (x0[i]),
                .x1                 (x1[i]),
                .x2                 (x2[i]),
                .cout               (cout[i]),
                .sum                (sum[i])
            );
        end
    endgenerate

endmodule


module compressor32_cell(
    input   x0,
    input   x1,
    input   x2,

    output  cout,
    output  sum
);

    assign cout = (x0 & x1) || (x2 && (x0 || x1)); // cout=a0a1+a2(a0+a1)
    assign sum = x0 ^ x1 ^ x2;

endmodule
