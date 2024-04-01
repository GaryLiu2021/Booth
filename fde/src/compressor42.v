module compressor42 #(
    parameter WIDTH = 32
)(
    input   [WIDTH-1:0]     x0,
    input   [WIDTH-1:0]     x1,
    input   [WIDTH-1:0]     x2,
    input   [WIDTH-1:0]     x3,

    output  [WIDTH-1:0]     cout,
    output  [WIDTH-1:0]     sum
);

    wire [WIDTH-1:0] eout;

    genvar i;
    generate
        for(i = 0;i < WIDTH; i = i + 1) begin: CELLS
            if(i==0)
                compressor42_cell u_compressor42_cell(
                    .x0                 (x0[i]),
                    .x1                 (x1[i]),
                    .x2                 (x2[i]),
                    .x3                 (x3[i]),
                    .ein                (1'b0),
                    .eout               (eout[i]),
                    .cout               (cout[i]),
                    .sum                (sum[i])
                );
            else
                compressor42_cell u_compressor42_cell(
                    .x0                 (x0[i]),
                    .x1                 (x1[i]),
                    .x2                 (x2[i]),
                    .x3                 (x3[i]),
                    .ein                (eout[i-1]),
                    .eout               (eout[i]),
                    .cout               (cout[i]),
                    .sum                (sum[i])
                );
        end
    endgenerate

endmodule


module compressor42_cell(
    input   x0,
    input   x1,
    input   x2,
    input   x3,
    input   ein,
    output  eout,
    output  cout,
    output  sum
);

    assign eout = (x3&x2)||(x2&x1)||(x3&x1);
    assign sum = x3 ^ x2 ^ x1 ^ x0 ^ ein;
    assign cout = (x0 & ~(x3 ^ x2 ^ x1 ^ x0)) || (ein & (x3 ^ x2 ^ x1 ^ x0));
    
endmodule