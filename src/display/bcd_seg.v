module bcd_seg #(
    parameter WIDTH = 4
)(
    input       [WIDTH*4-1:0]   bcd,
    output  reg [WIDTH*8-1:0]   seg
);
    
    integer i;

    always @(*) begin
        for(i=0;i<WIDTH;i=i+1)
            case(bcd[i*4+:4])
                4'd0: seg[i*8+:8] = 8'b11111100;
                4'd1: seg[i*8+:8] = 8'b01100000;
                4'd2: seg[i*8+:8] = 8'b11011010;
                4'd3: seg[i*8+:8] = 8'b11110010;
                4'd4: seg[i*8+:8] = 8'b01100110;
                4'd5: seg[i*8+:8] = 8'b10110110;
                4'd6: seg[i*8+:8] = 8'b10111110;
                4'd7: seg[i*8+:8] = 8'b11100000;
                4'd8: seg[i*8+:8] = 8'b11111110;
                4'd9: seg[i*8+:8] = 8'b11110110;
                default: seg[i*8+:8] = 8'b11111100;
            endcase
    end

endmodule