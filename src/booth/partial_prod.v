module partial_prod #(
	parameter			MODE_FIRST = 1'b0,
	parameter			MODE_MID   = 1'b0,
	parameter			MODE_LAST  = 1'b0
) (
    input       [31:0]  multiplicand,
    input               partial_zero,
    input               partial_one,
    input               partial_double,
    input               partial_reverse,
    input       [1:0]   partial_tail_in,

    output      [1:0]   partial_tail_out,
    output  reg [35:0]  partial_product
);

    wire [31:0] multiplicand_r = partial_reverse ? ~multiplicand : multiplicand;
    wire multiplicand_sig = multiplicand_r[31];
    assign partial_tail_out = 	partial_reverse ? {partial_double, partial_one} : 2'b00;
	wire [35:0] mid_single_product = {1'b1, ~multiplicand_sig, multiplicand_r, partial_tail_in};
	wire [35:0] mid_double_product = {1'b1, ~multiplicand_sig, multiplicand_r[30:0], 1'b0, partial_tail_in};
	wire [35:0] last_single_product = mid_single_product + (partial_tail_out << 2);
	wire [35:0] last_double_product = mid_double_product + (partial_tail_out << 2);

	generate
		case({MODE_FIRST, MODE_MID, MODE_LAST})
			3'b100: begin
				always @(*) begin
					if(partial_zero)
						partial_product = {1'b0, 1'b1, 2'b00, 32'd0};
					else
						case(1)
							partial_one: 
								partial_product = {1'b0, ~multiplicand_sig, {2{multiplicand_sig}}, multiplicand_r};
							partial_double: 
								partial_product = {1'b0, ~multiplicand_sig, multiplicand_sig, multiplicand_r, 1'b0};
						endcase
				end
			end
			3'b010: begin
				always @(*) begin
					if(partial_zero)
						partial_product = {2'b11, 32'd0, partial_tail_in};
					else
						case(1)
							partial_one: 
								partial_product = mid_single_product;
							partial_double: 
								partial_product = mid_double_product;
						endcase
				end
			end
			3'b001: begin
				always @(*) begin
					if(partial_zero)
						partial_product = {2'b11, 30'd0, partial_tail_out, partial_tail_in};
					else
						case(1)
							partial_one: 
								partial_product = last_single_product;
							partial_double: 
								partial_product = last_double_product;
						endcase
				end
			end
			default:
				$fatal(1, "Illegal mode of partial product generator.");
		endcase
	endgenerate

    // always @(*) begin
    //     if(partial_zero)
    //         partial_product = is_first_Pproduct ? {1'b0, 1'b1, 2'b00, 32'd0} : 
    //                           is_last_Pproduct  ? {2'b11, 30'd0, partial_tail_out, partial_tail_in} : {2'b11, 32'd0, partial_tail_in};
    //     else
    //         case(1)
    //             partial_one: 
    //                 partial_product = is_first_Pproduct ? {1'b0, ~multiplicand_sig, {2{multiplicand_sig}}, multiplicand_r} :
    //                                   is_last_Pproduct  ? last_single_product : mid_single_product;
    //             partial_double: 
    //                 partial_product = is_first_Pproduct ? {1'b0, ~multiplicand_sig, multiplicand_sig, multiplicand_r, 1'b0} :
    //                                   is_last_Pproduct  ? last_double_product : mid_double_product;
    //         endcase
    // end

endmodule //partial_prod
