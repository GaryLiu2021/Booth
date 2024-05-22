// `define __DEBUG

module bcd_bin (
    input       [15:0]   bcd,
    output      [13:0]   bin,
    output               illegal
);

    wire [13:0] bcd_0, bcd_1, bcd_2, bcd_3;
    assign bcd_0 = bcd[3:0];
    assign bcd_1 = (bcd[7:4] << 3) + (bcd[7:4] << 1);
    assign bcd_2 = (bcd[11:8] << 6) + (bcd[11:8] << 5) + (bcd[11:8] << 2);
    assign bcd_3 = (bcd[15:12] << 9) + (bcd[15:12] << 8) + (bcd[15:12] << 7) + (bcd[15:12] << 6) + (bcd[15:12] << 5) + (bcd[15:12] << 3);

    assign bin = bcd_0 + bcd_1 + bcd_2 + bcd_3;

endmodule

`ifdef __DEBUG

module test;

    reg [15:0] bcd;
    wire [13:0] bin;
    wire illegal;

    bcd_bin  u_bcd_bin (
        .bcd                     ( bcd       ),

        .bin                     ( bin       ),
        .illegal                 ( illegal   )
    );
    reg [3:0] num;

    initial begin
        repeat(10) begin
            repeat(4) begin
                num = {$random}%10;
                $display("%d", num);
                bcd = {bcd[11:0], num};
                $display("%b", bcd);
            end
            #(10);
            $display("%b, %d", bcd, bin);
        end
        $finish;
    end

endmodule

`endif