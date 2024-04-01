module top_mult (
    input               clk,
    input               rst,
    input               set,
    
    input               skp_c1, // small key pad input
    input               skp_c2, // small key pad input
    input               skp_c3, // small key pad input
    input               skp_r1, // small key pad input
    input               skp_r2, // small key pad input
    input               skp_r3, // small key pad input
    input               skp_r4, // small key pad input

    output  reg [7:0]   seg_7_00,
    output  reg [7:0]   seg_7_01,

    output  reg [7:0]   seg_7_10,


    output  reg [7:0]   seg_7_o0,
    output  reg [7:0]   seg_7_o1,
    output  reg [7:0]   seg_7_o2

);
    // output  reg [7:0]   seg_7_02,
    // output  reg [7:0]   seg_7_03,

    // output  reg [7:0]   seg_7_11,
    // output  reg [7:0]   seg_7_12,
    // output  reg [7:0]   seg_7_13,

    // output  reg [7:0]   seg_7_o3,
    // output  reg [7:0]   seg_7_o4,
    // output  reg [7:0]   seg_7_o5,
    // output  reg [7:0]   seg_7_o6,
    // output  reg [7:0]   seg_7_o7

    reg set_p1, rst_p1, skp_p1_c1, skp_p1_c2, skp_p1_c3, skp_p1_r1, skp_p1_r2, skp_p1_r3, skp_p1_r4;
    reg set_p2, rst_p2, skp_p2_c1, skp_p2_c2, skp_p2_c3, skp_p2_r1, skp_p2_r2, skp_p2_r3, skp_p2_r4;
    wire set_p, rst_p, skp_p_c1, skp_p_c2, skp_p_c3, skp_p_r1, skp_p_r2, skp_p_r3, skp_p_r4;


    always @(posedge clk) begin
        if(rst) begin
            set_p1 <= 0;
            rst_p1 <= 0;
            skp_p1_c1 <= 1;
            skp_p1_c2 <= 1;
            skp_p1_c3 <= 1;
            skp_p1_r1 <= 1;
            skp_p1_r2 <= 1;
            skp_p1_r3 <= 1;
            skp_p1_r4 <= 1;
            set_p2 <= 0;
            rst_p2 <= 0;
            skp_p2_c1 <= 1;
            skp_p2_c2 <= 1;
            skp_p2_c3 <= 1;
            skp_p2_r1 <= 1;
            skp_p2_r2 <= 1;
            skp_p2_r3 <= 1;
            skp_p2_r4 <= 1;
        end else begin
            set_p1 <= set;
            rst_p1 <= rst;
            skp_p1_c1 <= skp_c1;
            skp_p1_c2 <= skp_c2;
            skp_p1_c3 <= skp_c3;
            skp_p1_r1 <= skp_r1;
            skp_p1_r2 <= skp_r2;
            skp_p1_r3 <= skp_r3;
            skp_p1_r4 <= skp_r4;
            set_p2 <= set_p1;
            rst_p2 <= rst_p1;
            skp_p2_c1 <= skp_p1_c1;
            skp_p2_c2 <= skp_p1_c2;
            skp_p2_c3 <= skp_p1_c3;
            skp_p2_r1 <= skp_p1_r1;
            skp_p2_r2 <= skp_p1_r2;
            skp_p2_r3 <= skp_p1_r3;
            skp_p2_r4 <= skp_p1_r4;
        end
    end

    assign set_p = set_p1 & (~set_p2);
    assign rst_p = rst_p1 & (~rst_p2);
    assign skp_p_c1 = skp_p1_c1 | (~skp_p2_c1);
    assign skp_p_c2 = skp_p1_c2 | (~skp_p2_c2);
    assign skp_p_c3 = skp_p1_c3 | (~skp_p2_c3);
    assign skp_p_r1 = skp_p1_r1 | (~skp_p2_r1);
    assign skp_p_r2 = skp_p1_r2 | (~skp_p2_r2);
    assign skp_p_r3 = skp_p1_r3 | (~skp_p2_r3);
    assign skp_p_r4 = skp_p1_r4 | (~skp_p2_r4);

    reg [7:0]   seg_7_02;
    reg [7:0]   seg_7_03;
    reg [7:0]   seg_7_11;
    reg [7:0]   seg_7_12;
    reg [7:0]   seg_7_13;
    reg [7:0]   seg_7_o3;
    reg [7:0]   seg_7_o4;
    reg [7:0]   seg_7_o5;
    reg [7:0]   seg_7_o6;
    reg [7:0]   seg_7_o7;

    // FSM params

    localparam  S_IDLE = 2'd0,
                SIN1 = 2'd1,
                SIN2 = 2'd2,
                OUT = 2'd3;
    
    reg [1:0] status, n_status;

    //! input decode
    
    wire pad_valid;
    wire [3:0] pad_in_bcd;

    pad_bcd  u_pad_bcd (
        .clk                     ( clk           ),
        .skp_c1                  ( skp_p_c1      ),
        .skp_c2                  ( skp_p_c2      ),
        .skp_c3                  ( skp_p_c3      ),
        .skp_r1                  ( skp_p_r1      ),
        .skp_r2                  ( skp_p_r2      ),
        .skp_r3                  ( skp_p_r3      ),
        .skp_r4                  ( skp_p_r4      ),

        .pad_valid               ( pad_valid   ),
        .bcd                     ( pad_in_bcd  )
    );

    //! buffer bcd

    reg [15:0] buff_bcd_0, buff_bcd_1;

    //! buffer bcd to bin

    wire [13:0] buff_bin_0, buff_bin_1;
    wire  illegal;

    bcd_bin  u0_bcd_bin (
        .bcd                     ( {8'd0, buff_bcd_0[7:0]}),

        .bin                     ( buff_bin_0),
        .illegal                 (    )
    );

    bcd_bin  u1_bcd_bin (
        .bcd                     ( {12'd0, buff_bcd_1[3:0]}),

        .bin                     ( buff_bin_1),
        .illegal                 (    )
    );

    // Booth Multiplier

    reg [31:0] multiplicand, multiplier;
    wire [63:0] result;

    booth_multiplier u_booth_multiplier (
        .multiplicand       (multiplicand),
        .multiplier         (multiplier),

        .result             (result)
    );

    // Booth result bin to bcd

    wire  ready;
    wire  bcd_valid;
    wire  [35:0]  result_bcd;

    bin_bcd  u_bin_bcd (
        .clk                     ( clk         ),
        .rst                     ( rst         ),
        .bin_valid               ( status == OUT   ),
        .bin                     ( result[26:0]),

        .ready                   ( ready       ),
        .bcd_valid               ( bcd_valid   ),
        .bcd                     ( result_bcd  )
    );

    // bcd to segment7

    wire [31:0] o_seg_multiplicand;
    wire [31:0] o_seg_multiplier;
    wire [63:0] o_seg_result;

    bcd_seg #(
        .WIDTH ( 4 ))
    u0_bcd_seg (
        .bcd                     ( buff_bcd_0   ),
        .seg                     ( o_seg_multiplicand   )
    );

    bcd_seg #(
        .WIDTH ( 4 ))
    u1_bcd_seg (
        .bcd                     ( buff_bcd_1   ),
        .seg                     ( o_seg_multiplier   )
    );

    bcd_seg #(
        .WIDTH ( 8 ))
    uo_bcd_seg (
        .bcd                     ( result_bcd[31:0]),
        .seg                     ( o_seg_result   )
    );

    // maintain status machine

    always @(*) begin
        case(status)
            S_IDLE:
                if(set_p) 
                    n_status = SIN1;
                else if(rst)
                    n_status = S_IDLE;
                else
                    n_status = S_IDLE;
            SIN1:
                if(rst)
                    n_status = S_IDLE;
                else if(set_p)
                    n_status = SIN2;
                else
                    n_status = SIN1;
            SIN2:
                if(rst)
                    n_status = S_IDLE;
                else if(set_p)
                    n_status = OUT;
                else
                    n_status = SIN2;
            OUT:
                if(rst)
                    n_status = S_IDLE;
                else if(set_p)
                    n_status = SIN1;
                else
                    n_status = OUT;
        endcase
    end

    always @(posedge clk)
        if(rst)
            status <= S_IDLE;
        else
            status <= n_status;

    // maintain buffer

    always @(posedge clk) begin
        if(rst) begin
            {buff_bcd_0, buff_bcd_1} <= 'd0;
        end
        else
            case(status)
                S_IDLE:
                    {buff_bcd_0, buff_bcd_1} <= 'd0;
                SIN1:
                    if(pad_valid)
                        buff_bcd_0 <= {buff_bcd_0[11:0], pad_in_bcd};
                SIN2:
                    if(pad_valid)
                        buff_bcd_1 <= {buff_bcd_1[11:0], pad_in_bcd};
                OUT: ;
            endcase
    end
    

    // maintain mult input

    always @(posedge clk) begin
        if(rst) begin
            multiplicand <= 'd0;
            multiplier <= 'd0;
        end
        else
            case(status)
                S_IDLE: begin
                    multiplicand <= 'd0;
                    multiplier <= 'd0;
                end
                SIN1:
                    if(set_p)
                        multiplicand <= {18'd0, buff_bin_0};
                SIN2:
                    if(set_p)
                        multiplier <= {18'd0, buff_bin_1};
                OUT: ;
            endcase
    end

    
    // maintain output display

    always @(posedge clk) begin
        if(rst) begin
            seg_7_00 <= 'd0;
            seg_7_01 <= 'd0;
            seg_7_02 <= 'd0;
            seg_7_03 <= 'd0;
            seg_7_10 <= 'd0;
            seg_7_11 <= 'd0;
            seg_7_12 <= 'd0;
            seg_7_13 <= 'd0;
            seg_7_o0 <= 'd0;
            seg_7_o1 <= 'd0;
            seg_7_o2 <= 'd0;
            seg_7_o3 <= 'd0;
            seg_7_o4 <= 'd0;
            seg_7_o5 <= 'd0;
            seg_7_o6 <= 'd0;
            seg_7_o7 <= 'd0;
        end
        else begin
            case(status)
                S_IDLE: begin
                    seg_7_00 <= 'd0;
                    seg_7_01 <= 'd0;
                    seg_7_02 <= 'd0;
                    seg_7_03 <= 'd0;
                    seg_7_10 <= 'd0;
                    seg_7_11 <= 'd0;
                    seg_7_12 <= 'd0;
                    seg_7_13 <= 'd0;
                    seg_7_o0 <= 'd0;
                    seg_7_o1 <= 'd0;
                    seg_7_o2 <= 'd0;
                    seg_7_o3 <= 'd0;
                    seg_7_o4 <= 'd0;
                    seg_7_o5 <= 'd0;
                    seg_7_o6 <= 'd0;
                    seg_7_o7 <= 'd0;
                end
                SIN1:
                    {seg_7_03, seg_7_02, seg_7_01, seg_7_00} <= o_seg_multiplicand;
                SIN2:
                    {seg_7_13, seg_7_12, seg_7_11, seg_7_10} <= o_seg_multiplier;
                OUT:
                    {seg_7_o7, seg_7_o6, seg_7_o5, seg_7_o4, seg_7_o3, seg_7_o2, seg_7_o1, seg_7_o0} <=  o_seg_result;
            endcase
        end

    end

endmodule
