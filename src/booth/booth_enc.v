module booth_enc (
    input   [2:0]   booth_input,
    output          partial_reverse, // 1 for negative, 0 for positive
    output          partial_zero,
    output          partial_one,
    output          partial_double
);

    assign partial_reverse = (booth_input == 3'b100) || (booth_input == 3'b101) || (booth_input == 3'b110);
    assign partial_zero = (booth_input == 3'b000) || (booth_input == 3'b111);
    assign partial_double = (booth_input == 3'b100) || (booth_input == 3'b011);
    assign partial_one = !partial_zero && !partial_double;

endmodule //booth_enc
