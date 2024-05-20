// `define __DEBUG
`include "define.v"

module booth_multiplier(
	input				clk,
	input				rstn,
    input		[31:0]  multiplicand,
    input		[31:0]  multiplier,

    output	reg	[63:0]  result
);

    // booth_enc Inputs
    wire  [32:0] booth_input;
    assign booth_input = {multiplier, 1'b0};

    // booth_enc Outputs
    wire  [15:0] partial_reverse;
    wire  [15:0] partial_zero;
    wire  [15:0] partial_one;
    wire  [15:0] partial_double;
    wire  [31:0] partial_tail;
    wire  [35:0] partial_product [15:0];

    genvar i;
    generate
        for(i=0;i<16;i=i+1) begin: DECODE_GEN
            booth_enc  u_booth_enc (
                .booth_input             ( {booth_input[2*i+2], booth_input[2*i+1], booth_input[2*i]}        ),

                .partial_reverse         ( partial_reverse[i]   ),
                .partial_zero            ( partial_zero[i]       ),
                .partial_one             ( partial_one[i]        ),
                .partial_double          ( partial_double[i]     )
            );
            if(i==0)
                partial_prod #(.MODE_FIRST(1'b1))
				u_partial_prod  (
                    .multiplicand            ( multiplicand        ),
                    .partial_zero            ( partial_zero[i]     ),
                    .partial_one             ( partial_one[i]      ),
                    .partial_double          ( partial_double[i]   ),
                    .partial_reverse         ( partial_reverse[i]  ),
                    .partial_tail_in         ( 2'd0   ),

                    .partial_tail_out        ( {partial_tail[2*i+1], partial_tail[2*i]} ),
                    .partial_product         ( partial_product[i]  )
                );
            else if(i==15)
                partial_prod #(.MODE_LAST(1'b1))
				u_partial_prod (
                    .multiplicand            ( multiplicand        ),
                    .partial_zero            ( partial_zero[i]     ),
                    .partial_one             ( partial_one[i]      ),
                    .partial_double          ( partial_double[i]   ),
                    .partial_reverse         ( partial_reverse[i]  ),
                    .partial_tail_in         ( {partial_tail[2*i-1], partial_tail[2*i-2]} ),

                    .partial_tail_out        ( {partial_tail[2*i+1], partial_tail[2*i]} ),
                    .partial_product         ( partial_product[i]  )
                );
            else
                partial_prod #(.MODE_MID(1'b1))
				u_partial_prod (
                    .multiplicand            ( multiplicand        ),
                    .partial_zero            ( partial_zero[i]     ),
                    .partial_one             ( partial_one[i]      ),
                    .partial_double          ( partial_double[i]   ),
                    .partial_reverse         ( partial_reverse[i]  ),
                    .partial_tail_in         ( {partial_tail[2*i-1], partial_tail[2*i-2]} ),

                    .partial_tail_out        ( {partial_tail[2*i+1], partial_tail[2*i]} ),
                    .partial_product         ( partial_product[i]  )
                );
        end
    endgenerate

    wire [39:0] layer0_pProduct_0 [3:0];
    wire [39:0] layer0_cout_0;
    wire [39:0] layer0_sum_0;

    wire [41:0] layer0_pProduct_1 [3:0];
    wire [41:0] layer0_cout_1;
    wire [41:0] layer0_sum_1;

    wire [41:0] layer0_pProduct_2 [3:0];
    wire [41:0] layer0_cout_2;
    wire [41:0] layer0_sum_2;

    wire [41:0] layer0_pProduct_3 [3:0];
    wire [41:0] layer0_cout_3;
    wire [41:0] layer0_sum_3;


    wire [48:0] layer1_pProduct_0 [3:0];
    wire [48:0] layer1_cout_0;
    wire [48:0] layer1_sum_0;

    wire [50:0] layer1_pProduct_1 [3:0];
    wire [50:0] layer1_cout_1;
    wire [50:0] layer1_sum_1;

    wire [64:0] layer2_pProduct [3:0];
    wire [64:0] layer2_cout;
    wire [64:0] layer2_sum;

    wire [64:0] layer3_pProduct [1:0];

    // partial product -> layer 0 input
    assign layer0_pProduct_0[0] = {4'b0000,partial_product[0]};
    assign layer0_pProduct_0[1] = {4'b0000,partial_product[1]};
    assign layer0_pProduct_0[2] = {2'b00, partial_product[2], 2'b00};
    assign layer0_pProduct_0[3] = {partial_product[3], 4'b0000};

    generate
        for(i=0;i<4;i=i+1) begin: LAYER0
            assign layer0_pProduct_1[i] = {6'b000000,partial_product[4+i]} << (i*2);
            assign layer0_pProduct_2[i] = {6'b000000,partial_product[8+i]} << (i*2);
            assign layer0_pProduct_3[i] = {6'b000000,partial_product[12+i]} << (i*2);
        end
    endgenerate

	// cut between pProduct and layer0
	`GEN_DELAY_ARRAY(layer0_pProduct_0,40,4,1,layer0_pProduct_0_del);
	`GEN_DELAY_ARRAY(layer0_pProduct_1,42,4,1,layer0_pProduct_1_del);
	`GEN_DELAY_ARRAY(layer0_pProduct_2,42,4,1,layer0_pProduct_2_del);
	`GEN_DELAY_ARRAY(layer0_pProduct_3,42,4,1,layer0_pProduct_3_del);

    // layer 0
    compressor42 #(
        .WIDTH ( 40 )
    ) u_compressor42_l0_0 (
        .x0                      ( layer0_pProduct_0_del[0]     ),
        .x1                      ( layer0_pProduct_0_del[1]     ),
        .x2                      ( layer0_pProduct_0_del[2]     ),
        .x3                      ( layer0_pProduct_0_del[3]     ),

        .cout                    ( layer0_cout_0   ),
        .sum                     ( layer0_sum_0    )
    );


    compressor42 #(
        .WIDTH ( 42 )
    ) u_compressor42_l0_1 (
        .x0                      ( layer0_pProduct_1_del[0]     ),
        .x1                      ( layer0_pProduct_1_del[1]     ),
        .x2                      ( layer0_pProduct_1_del[2]     ),
        .x3                      ( layer0_pProduct_1_del[3]     ),

        .cout                    ( layer0_cout_1   ),
        .sum                     ( layer0_sum_1    )
    );

    compressor42 #(
        .WIDTH ( 42 )
    ) u_compressor42_l0_2 (
        .x0                      ( layer0_pProduct_2_del[0]     ),
        .x1                      ( layer0_pProduct_2_del[1]     ),
        .x2                      ( layer0_pProduct_2_del[2]     ),
        .x3                      ( layer0_pProduct_2_del[3]     ),

        .cout                    ( layer0_cout_2   ),
        .sum                     ( layer0_sum_2    )
    );

    compressor42 #(
        .WIDTH ( 42 )
    ) u_compressor42_l0_3 (
        .x0                      ( layer0_pProduct_3_del[0]     ),
        .x1                      ( layer0_pProduct_3_del[1]     ),
        .x2                      ( layer0_pProduct_3_del[2]     ),
        .x3                      ( layer0_pProduct_3_del[3]     ),

        .cout                    ( layer0_cout_3   ),
        .sum                     ( layer0_sum_3    )
    );

    // layer 0 output -> layer 1 input
    assign layer1_pProduct_0[0] = {9'd0, layer0_sum_0};
    assign layer1_pProduct_0[1] = {8'd0, layer0_cout_0, 1'b0};
    assign layer1_pProduct_0[2] = {1'b0, layer0_sum_1, 6'd0};
    assign layer1_pProduct_0[3] = {1'b0, layer0_cout_1[40:0], 7'd0};
    assign layer1_pProduct_1[0] = {9'd0, layer0_sum_2};
    assign layer1_pProduct_1[1] = {8'd0, layer0_cout_2, 1'b0};
    assign layer1_pProduct_1[2] = {1'b0, layer0_sum_3, 8'd0};
    assign layer1_pProduct_1[3] = {1'b0, layer0_cout_3[40:0], 9'd0};

	// cut between layer0 and layer1
	`GEN_DELAY_ARRAY(layer1_pProduct_0,49,4,1,layer1_pProduct_0_del);
	`GEN_DELAY_ARRAY(layer1_pProduct_1,51,4,1,layer1_pProduct_1_del);

    // layer 1
    compressor42 #(
        .WIDTH ( 49 )
    ) u_compressor42_l1_0 (
        .x0                      ( layer1_pProduct_0_del[0]     ),
        .x1                      ( layer1_pProduct_0_del[1]     ),
        .x2                      ( layer1_pProduct_0_del[2]     ),
        .x3                      ( layer1_pProduct_0_del[3]     ),

        .cout                    ( layer1_cout_0   ),
        .sum                     ( layer1_sum_0    )
    );

    compressor42 #(
        .WIDTH ( 51 )
    ) u_compressor42_l1_1 (
        .x0                      ( layer1_pProduct_1_del[0]     ),
        .x1                      ( layer1_pProduct_1_del[1]     ),
        .x2                      ( layer1_pProduct_1_del[2]     ),
        .x3                      ( layer1_pProduct_1_del[3]     ),

        .cout                    ( layer1_cout_1   ),
        .sum                     ( layer1_sum_1    )
    );

    // layer 1 output -> layer 2 input
    assign layer2_pProduct[0] = {16'd0, layer1_sum_0};
    assign layer2_pProduct[1] = {15'd0, layer1_cout_0, 1'b0};
    assign layer2_pProduct[2] = {layer1_sum_1, 14'd0};
    assign layer2_pProduct[3] = {layer1_cout_1[49:0], 15'b0};

	// cut between layer1 and layer2
	`GEN_DELAY_ARRAY(layer2_pProduct,65,4,1,layer2_pProduct_del);

    // layer 2
    compressor42 #(
        .WIDTH ( 65 )
    ) u_compressor42_l2 (
        .x0                      ( layer2_pProduct_del[0]     ),
        .x1                      ( layer2_pProduct_del[1]     ),
        .x2                      ( layer2_pProduct_del[2]     ),
        .x3                      ( layer2_pProduct_del[3]     ),

        .cout                    ( layer2_cout   ),
        .sum                     ( layer2_sum    )
    );

    assign layer3_pProduct[0] = layer2_sum;
    assign layer3_pProduct[1] = layer2_cout << 1;

	wire [64:0] result_ex = layer3_pProduct[0] + layer3_pProduct[1];

	always @(posedge clk or negedge rstn)
		if(!rstn)
			result <= 'd0;
		else
			result <= result_ex[63:0];

// Test
`ifdef __DEBUG

    task automatic checkExpand_16;
        input [3:0] start;
        input [3:0] finish;
        input [36*16-1:0] ppl;
        input [63:0] in1;
        input [63:0] in2;

        reg [63:0] result;
        reg [63:0] ref;
        reg [63:0] buff;
        integer i;

        begin
            $display("Checking From %d To %d!", start, finish);
            // $display("in1\t= %b\nin2\t= %b\npp0\t= %b\npp1\t= %b\npp2\t= %b\npp3\t= %b", in1, in2, pp0, pp1, pp2, pp3);
            result = (in1 << 1) + in2;
            ref = 'd0;
            buff = 'd0;
            if(start == 0) begin
                ref[35:0] = ppl[35:0];
                for(i=1;i<=finish;i=i+1) begin
                    buff = ppl[36*i+:36] << 2*(i-1); //! bug: "<<" operator priority
                    // $display("ref + ppl:\t%b +\n\t\t%64b", ref, buff);
                    ref = ref + buff;
                end
            end else
                for(i=0;i<=finish-start;i=i+1) begin
                    buff = ppl[36*(i+start)+:36] << 2*i;
                    // $display("ref + ppl:\t%b +\n\t\t%64b", ref, buff);
                    ref = ref + (ppl[36*(i+start)+:36] << 2*i);
                end
            if(result != ref)
                $display("error!!!\nresult\t= %b\nshould\t= %b\n", result, ref);
        end

    endtask

    reg [63:0] task_reg0, task_reg1;
    reg [36*16-1:0] pProduct_vec = 0;
    integer j;

    always @(multiplicand, multiplier) begin
        // #(2);
        for(j=0;j<16;j=j+1) begin
            pProduct_vec[36*j+:36] = partial_product[j];
            $display("%b", partial_product[j]);
        end
        checkExpand_16(0, 3, pProduct_vec, layer0_cout_0, layer0_sum_0);
        checkExpand_16(4, 7, pProduct_vec, layer0_cout_1, layer0_sum_1);
        checkExpand_16(8, 11, pProduct_vec, layer0_cout_2, layer0_sum_2);
        checkExpand_16(12, 15, pProduct_vec, layer0_cout_3, layer0_sum_3);
        checkExpand_16(0, 7, pProduct_vec, layer1_cout_0, layer1_sum_0);
        checkExpand_16(8, 15, pProduct_vec, layer1_cout_1, layer1_sum_1);
        checkExpand_16(0, 15, pProduct_vec, layer2_cout, layer2_sum);
    end

`endif // end of debug

endmodule
