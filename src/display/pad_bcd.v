module pad_bcd (
    input               clk,
    input               rst,
    input               skp_c1, // small key pad input
    input               skp_c2, // small key pad input
    input               skp_c3, // small key pad input
    input               skp_r1, // small key pad input
    input               skp_r2, // small key pad input
    input               skp_r3, // small key pad input
    input               skp_r4, // small key pad input

    output  reg         pad_valid,
    output  reg [3:0]   bcd
);

    wire [6:0] pad = {skp_c1, skp_c2, skp_c3, skp_r1, skp_r2, skp_r3, skp_r4};

    always @(posedge clk) begin
        if(rst)
            bcd <= 4'b0000;
        else
        case(pad)
            7'b0110111: bcd <= 4'b0001;
            7'b1010111: bcd <= 4'b0010;
            7'b1100111: bcd <= 4'b0011;
            7'b0111011: bcd <= 4'b0100;
            7'b1011011: bcd <= 4'b0101;
            7'b1101011: bcd <= 4'b0110;
            7'b0111101: bcd <= 4'b0111;
            7'b1011101: bcd <= 4'b1000;
            7'b1101101: bcd <= 4'b1001;
            7'b1011110: bcd <= 4'b0000;
            7'b1111111: bcd <= 4'b1111;
            default: bcd <= 4'b0000;
        endcase
    end

    always @(posedge clk) begin
        if(rst)
            pad_valid <= 0;
        else
        case(pad)
            7'b0110111: pad_valid <= 1;
            7'b1010111: pad_valid <= 1;
            7'b1100111: pad_valid <= 1;
            7'b0111011: pad_valid <= 1;
            7'b1011011: pad_valid <= 1;
            7'b1101011: pad_valid <= 1;
            7'b0111101: pad_valid <= 1;
            7'b1011101: pad_valid <= 1;
            7'b1101101: pad_valid <= 1;
            7'b1011110: pad_valid <= 1;
            7'b1111111: pad_valid <= 0;
            default: pad_valid <= 0;
        endcase
    end

`ifdef __DEBUG
    always@(bcd)
        if(bcd == 4'b1110)
            $display("fatal error: wrong input!");
`endif

endmodule