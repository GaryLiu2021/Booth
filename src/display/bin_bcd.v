// `define __DEBUG

module bin_bcd(
    input               clk,
    input               rst,
    input               bin_valid,
    input       [26:0]  bin,
    output              ready,
    output              bcd_valid,
    output      [35:0]  bcd
);

    reg [2:0] counter;
    reg s_work;

    always @(posedge clk) begin
        if(rst)
            s_work <= 0;
        else if(bin_valid && ready)
            s_work <= 1;
        else if(bcd_valid)
            s_work <= 0;
    end

    always @(posedge clk) begin
        if(rst)
            counter <= 'd0;
        else if(s_work)
            counter <= counter == 3'd6 ? 3'd0 : counter + 1'b1;
    end

    assign ready = ~s_work;
    assign bcd_valid = counter == 3'd6;

    wire [27:0] bin_ext = {1'b0, bin};
    wire [36*7-1:0] bcd_next;
    reg [36*7-1:0] bcd_last;
    genvar i;
    generate
        for(i=0;i<7;i=i+1) begin:gen_cell
            if(i==0)
                bin_bcd_cell u_bin_bcd_cell(
                    .is_last        (1'b0),
                    .bin            (bin_ext[27:24]),
                    .bcd_last       (36'd0),
                    .bcd_next       (bcd_next[i*36+35:i*36])
                );
            else
                bin_bcd_cell u_bin_bcd_cell(
                    .is_last        (i==6),
                    .bin            (bin_ext[28-i*4-1-:4]),
                    .bcd_last       (bcd_last[i*36-1:(i-1)*36]),
                    .bcd_next       (bcd_next[i*36+35:i*36])
                );
        end
    endgenerate

    always @(posedge clk) begin
        if(rst)
            bcd_last <= 'd0;
        else if(s_work)
            bcd_last <= bcd_next;
    end

    assign bcd = bcd_next[36*7-1-:36];
    
`ifdef __DEBUG
    always @(posedge clk)
        if(s_work)
            $display("last:%b now:%b", bcd_last[counter*36+35-:36], bcd_next[counter*36+35-:36]);
`endif

endmodule

module bin_bcd_cell(
    input               is_last,
    input       [3:0]   bin,
    input       [35:0]  bcd_last,
    output      [35:0]  bcd_next
);

    genvar i;
    wire [35:0] bcd_shift_1 = {bcd_last[34:0], bin[3]};
    wire [35:0] bcd_shift_1_o;
    wire [35:0] bcd_shift_2 = {bcd_shift_1_o, bin[2]};
    wire [35:0] bcd_shift_2_o;
    wire [35:0] bcd_shift_3 = {bcd_shift_2_o, bin[1]};
    wire [35:0] bcd_shift_3_o;
    wire [35:0] bcd_shift_4 = {bcd_shift_3_o, bin[0]};
    wire [35:0] bcd_shift_4_o;

    generate
        for(i=0;i<9;i=i+1) begin:gen
            assign bcd_shift_1_o[i*4+3:i*4] = bcd_shift_1[i*4+3:i*4] > 4'd4 ? (bcd_shift_1[i*4+3:i*4] + 4'd3) : bcd_shift_1[i*4+3:i*4];
            assign bcd_shift_2_o[i*4+3:i*4] = bcd_shift_2[i*4+3:i*4] > 4'd4 ? (bcd_shift_2[i*4+3:i*4] + 4'd3) : bcd_shift_2[i*4+3:i*4];
            assign bcd_shift_3_o[i*4+3:i*4] = bcd_shift_3[i*4+3:i*4] > 4'd4 ? (bcd_shift_3[i*4+3:i*4] + 4'd3) : bcd_shift_3[i*4+3:i*4];
            assign bcd_shift_4_o[i*4+3:i*4] = bcd_shift_4[i*4+3:i*4] > 4'd4 ? (bcd_shift_4[i*4+3:i*4] + 4'd3) : bcd_shift_4[i*4+3:i*4];
        end
    endgenerate

    assign bcd_next = is_last ? bcd_shift_4 : bcd_shift_4_o;

endmodule


`ifdef __DEBUG

module test;

    reg clk = 1;
    always #(10) clk = ~clk;
    reg rst;
    reg bin_valid = 0;

    reg [26:0] rand_in;
    reg [26:0] bin;

    // outports wire
    wire [35:0] 	bcd;
    wire ready;
    wire bcd_valid;
    
    bin_bcd  u_bin_bcd (
        .clk                     ( clk         ),
        .rst                     ( rst         ),
        .bin_valid               ( bin_valid   ),
        .bin                     ( bin         ),

        .ready                   ( ready       ),
        .bcd_valid               ( bcd_valid   ),
        .bcd                     ( bcd         )
    );


    initial begin
        rst = 1;
        #(100) rst = 0;
        repeat(10) begin
            wait(ready)
                rand_in = {$random}%100000000;
            bin = rand_in;
            bin_valid = 1;
            @(posedge bcd_valid) begin
                $display("%d %0d%0d%0d%0d%0d%0d%0d%0d",bin,bcd[31-:4],bcd[27-:4],bcd[23-:4],bcd[19-:4],bcd[15-:4],bcd[11-:4],bcd[7-:4],bcd[3-:4]);
            end
        end
        $finish;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, test);
    end

endmodule

`endif