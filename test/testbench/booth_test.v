`include "define.v"

`ifndef TESTNUM
`define TESTNUM 10
`endif

module booth_test;

localparam	S_IDLE	=	0,
			S_WORK	=	1,
			S_DONE	=	2;
localparam TESTNUM	=	`TESTNUM;

// booth_multiplier Parameters
parameter PERIOD  = 20;

// Clock generator
reg clk	= 0;
always #(PERIOD/2) clk=~clk;

// Input driver
reg   rstn	=	0;
reg [31:0] random_in0, random_in1;
reg	[1:0] inputState = S_IDLE;
initial begin
	random_in0 = 0;
	random_in1 = 0;
	#(100) rstn = 1;
	#(PERIOD);
	inputState = S_WORK;
    repeat(TESTNUM) begin
        random_in0 = $random;
        random_in1 = $random;
        #(PERIOD);
    end
	inputState = S_DONE;
end

// Dut module

// booth_multiplier Outputs
wire  [63:0]  dutOutput;

booth_multiplier  u_booth_multiplier (
	.clk                     ( clk            ),
    .rstn                    ( rstn           ),
    .multiplicand            ( random_in0 [31:0] ),
    .multiplier              ( random_in1 [31:0] ),

    .result                  ( dutOutput  [63:0] )
);

// Golden module
	wire [63:0] refResult = $signed(random_in0) * $signed(random_in1);
	wire [63:0] refOutput;
	wire [31:0]	random_in0_del, random_in1_del;

	`GEN_DELAY(clk, rstn, refResult, 64, 5, refOutput)
	`GEN_DELAY(clk, rstn, random_in0, 32, 5, random_in0_del)
	`GEN_DELAY(clk, rstn, random_in1, 32, 5, random_in1_del)

// Validate
	wire [1:0] outputState;
	`GEN_DELAY(clk, rstn, inputState, 2, 5, outputState)
	wire pass = ($signed(dutOutput) == $signed(refOutput));

	always @(posedge clk) begin
	case(outputState)
		S_IDLE:;
		S_WORK:
			if(pass)
				$display("%d * %d = %d", $signed(random_in0_del), $signed(random_in1_del), $signed(refOutput));
			else begin
				$display("\033[1;31m%d * %d\nshould be:\t%b\nbut:\t\t%b\033[0m", $signed(random_in0_del), $signed(random_in1_del), $signed(refOutput), $signed(dutOutput));
				$stop;
			end
		S_DONE: begin
 			$display("\n\033[1;32mDUT passed %0d tests.\033[0m\n",TESTNUM);
			$finish;
		end
	endcase
	end

`ifdef __VCD_OUT
    initial
    begin            
        $dumpfile("wave.vcd");
        $dumpvars(0, booth_test);
    end
`endif

endmodule
