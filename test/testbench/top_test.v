`timescale 1ns/1ps

module top_test;

// top_mult Inputs
reg   clk;
reg   rst;
reg   set;
reg [6:0]   skp;
wire   skp_c1;
wire   skp_c2;
wire   skp_c3;
wire   skp_r1;
wire   skp_r2;
wire   skp_r3;
wire   skp_r4;
assign {skp_c1, skp_c2, skp_c3, skp_r1, skp_r2, skp_r3, skp_r4} = skp;

// top_mult Outputs
wire  [7:0]  seg_7_00;
wire  [7:0]  seg_7_01;
wire  [7:0]  seg_7_02;
wire  [7:0]  seg_7_03;
wire  [7:0]  seg_7_10;
wire  [7:0]  seg_7_11;
wire  [7:0]  seg_7_12;
wire  [7:0]  seg_7_13;
wire  [7:0]  seg_7_o0;
wire  [7:0]  seg_7_o1;
wire  [7:0]  seg_7_o2;
wire  [7:0]  seg_7_o3;
wire  [7:0]  seg_7_o4;
wire  [7:0]  seg_7_o5;
wire  [7:0]  seg_7_o6;
wire  [7:0]  seg_7_o7;

top_mult  u_top_mult (
    .clk                     ( clk        ),
    .rst                     ( rst        ),
    .set                     ( set        ),
    .skp_c1                  ( skp_c1     ),
    .skp_c2                  ( skp_c2     ),
    .skp_c3                  ( skp_c3     ),
    .skp_r1                  ( skp_r1     ),
    .skp_r2                  ( skp_r2     ),
    .skp_r3                  ( skp_r3     ),
    .skp_r4                  ( skp_r4     ),

    .seg_7_00                ( seg_7_00   ),
    .seg_7_01                ( seg_7_01   ),
    // .seg_7_02                ( seg_7_02   ),
    // .seg_7_03                ( seg_7_03   ),
    .seg_7_10                ( seg_7_10   ),
    // .seg_7_11                ( seg_7_11   ),
    // .seg_7_12                ( seg_7_12   ),
    // .seg_7_13                ( seg_7_13   ),
    .seg_7_o0                ( seg_7_o0   ),
    .seg_7_o1                ( seg_7_o1   ),
    .seg_7_o2                ( seg_7_o2   )
    // .seg_7_o3                ( seg_7_o3   ),
    // .seg_7_o4                ( seg_7_o4   ),
    // .seg_7_o5                ( seg_7_o5   ),
    // .seg_7_o6                ( seg_7_o6   ),
    // .seg_7_o7                ( seg_7_o7   )
);

wire  [15:0]  bcd_multiplicand, bcd_multiplier;
wire  [31:0]  bcd_result;

// seg_bcd #(
//     .WIDTH ( 4 ))
//  u0_seg_bcd (
//     .seg                     ( {seg_7_03, seg_7_02, seg_7_01, seg_7_00}   ),
//     .bcd                     ( bcd_multiplicand   )
// );

// seg_bcd #(
//     .WIDTH ( 4 ))
//  u1_seg_bcd (
//     .seg                     ( {seg_7_13, seg_7_12, seg_7_11, seg_7_10}   ),
//     .bcd                     ( bcd_multiplier   )
// );

// seg_bcd #(
//     .WIDTH ( 8 ))
//  u2_seg_bcd (
//     .seg                     ( {seg_7_o7, seg_7_o6, seg_7_o5, seg_7_o4, seg_7_o3, seg_7_o2, seg_7_o1, seg_7_o0}   ),
//     .bcd                     ( bcd_result   )
// );

initial begin
    clk = 1;
    rst = 1;
    set = 0;
    skp = 7'b1111111;
end

always #(10) clk = ~clk;

task pad_input;
    input   [3:0]   num;
    
    begin
    @(posedge clk)
    case(num)
        4'd0: skp <= 7'b1011110;
        4'd1: skp <= 7'b0110111;
        4'd2: skp <= 7'b1010111;
        4'd3: skp <= 7'b1100111;
        4'd4: skp <= 7'b0111011;
        4'd5: skp <= 7'b1011011;
        4'd6: skp <= 7'b1101011;
        4'd7: skp <= 7'b0111101;
        4'd8: skp <= 7'b1011101;
        4'd9: skp <= 7'b1101101;
    endcase
    repeat(10) @(posedge clk);
    skp <= 7'b1111111;
    repeat(10) @(posedge clk);
    end
endtask

task push_set; 
    begin
        set = 1;
        repeat(10) @(posedge clk);
        set = 0;
    end
endtask

initial begin
    #(100) rst = 0;
    #(100);

    // specific test
    push_set;
    pad_input(4'd4);
    pad_input(4'd4);
    pad_input({$random}%10);
    pad_input({$random}%10);
    pad_input({$random}%10);
    push_set;
    pad_input(4'd1);
    pad_input({$random}%10);
    pad_input({$random}%10);
    push_set;
    #(500);

    // random test
    repeat(10) begin
        push_set;
        pad_input({$random}%10);
        pad_input({$random}%10);
        pad_input({$random}%10);
        pad_input({$random}%10);
        pad_input({$random}%10);
        push_set;
        // $display("multiplicand bcd:%b", bcd_multiplicand);
        pad_input({$random}%10);
        pad_input({$random}%10);
        pad_input({$random}%10);
        // pad_input(4'd0);
        push_set;
        // $display("multiplier bcd:%b", bcd_multiplier);
        #(500);
        // $display("result bcd:%b", bcd_result);
    end
    $finish;
end

initial begin            
    $dumpfile("wave.vcd");
    $dumpvars(0, top_test);
end

endmodule

module seg_bcd #(
    parameter WIDTH = 4
)(
    output  reg [WIDTH*4-1:0]   bcd,
    input       [WIDTH*8-1:0]   seg
);
    
    integer i;

    always @(*) begin
        for(i=0;i<WIDTH;i=i+1)
            case(seg[i*8+:8])
                8'b11111100: bcd[i*4+:4] = 4'd0;
                8'b01100000: bcd[i*4+:4] = 4'd1;
                8'b11011010: bcd[i*4+:4] = 4'd2;
                8'b11110010: bcd[i*4+:4] = 4'd3;
                8'b01100110: bcd[i*4+:4] = 4'd4;
                8'b10110110: bcd[i*4+:4] = 4'd5;
                8'b10111110: bcd[i*4+:4] = 4'd6;
                8'b11100000: bcd[i*4+:4] = 4'd7;
                8'b11111110: bcd[i*4+:4] = 4'd8;
                8'b11110110: bcd[i*4+:4] = 4'd9;
                default: bcd[i*4+:4] = 4'hx;
            endcase
    end

endmodule