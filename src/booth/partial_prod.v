module partial_prod (
    input       [31:0]  multiplicand,
    input               partial_zero,
    input               partial_one,
    input               partial_double,
    input               partial_reverse,
    input       [1:0]   partial_tail_in,

    input               is_first_Pproduct,
    input               is_last_Pproduct,

    output      [1:0]   partial_tail_out,
    output  reg [35:0]  partial_product
);

    wire [31:0] multiplicand_r = partial_reverse ? ~multiplicand : multiplicand;
    wire multiplicand_sig = multiplicand_r[31];
    assign partial_tail_out = partial_reverse ? 2'b01 : 2'b00;

    always @(*) begin
        if(partial_zero)
            partial_product = is_first_Pproduct ? {1'b0, 1'b1, 2'b00, 32'd0} : 
                              is_last_Pproduct  ? {2'b11, 32'd0, partial_tail_in} : {2'b11, 32'd0, partial_tail_in};
        else
            case(1)
                partial_one: 
                    partial_product = is_first_Pproduct ? {1'b0, ~multiplicand_sig, {2{multiplicand_sig}}, multiplicand_r} :
                                      is_last_Pproduct  ? {1'b1, ~multiplicand_sig, multiplicand_r, partial_tail_in} : {1'b1, ~multiplicand_sig, multiplicand_r, partial_tail_in};
                partial_double: 
                    partial_product = is_first_Pproduct ? {1'b0, ~multiplicand_sig, multiplicand_sig, multiplicand_r, partial_reverse} :
                                      is_last_Pproduct  ? {1'b1, ~multiplicand_sig, multiplicand_r[30:0], partial_reverse, partial_tail_in} : 
                                                          {1'b1, ~multiplicand_sig, multiplicand_r[30:0], partial_reverse, partial_tail_in};
            endcase
    end

endmodule //partial_prod
