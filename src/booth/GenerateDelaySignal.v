module GenerateDelaySignal #(
	parameter WIDTH = 8,
	parameter DELAY = 2
)(
	input				clk,
	input				rstn,

	input	[WIDTH-1:0]	source,
	output	[WIDTH-1:0]	delay
);

	integer iterDelay, iterWidth;
	reg [WIDTH*DELAY-1:0] delayBuffer;

	always @(posedge clk or negedge rstn) begin
		if(!rstn)
			delayBuffer <= 'd0;
		else begin
			for(iterWidth=0;iterWidth<WIDTH;iterWidth=iterWidth+1) begin: GenDelay_width0
				delayBuffer[iterWidth] <= source[iterWidth];
			end
			for(iterDelay=1;iterDelay<DELAY;iterDelay=iterDelay+1) begin: GenDelay_delay
				for(iterWidth=0;iterWidth<WIDTH;iterWidth=iterWidth+1) begin: GenDelay_width
					delayBuffer[iterDelay*WIDTH+iterWidth] <= delayBuffer[(iterDelay-1)*WIDTH+iterWidth];
				end
			end
		end
	end

	assign delay = delayBuffer[WIDTH*DELAY-1 -: WIDTH];

endmodule


// `ifndef GEN_DELAY
// `define GEN_DELAY(iclk, irstn, src, width, ndelay, out) \
// GenerateDelaySignal #( \
// 	.WIDTH(width), \
// 	.DELAY(ndelay) \
// ) u_GenerateDelaySignal_``src`` ( \
// 	.clk(iclk), \
// 	.rstn(irstn), \
// 	.source(src), \
// 	.delay(out) \
// );
// `endif

// // src and out should be wire array
// `ifndef GEN_DELAY_ARRAY
// `define GEN_DELAY_ARRAY(src, width, depth, delay, out) \
// wire [width-1:0] out [depth-1:0]; \
// genvar ``src``_i; \
// generate \
// 	for(``src``_i=0;``src``_i<depth;``src``_i=``src``_i+1) begin: GEN_DELAY_ARRAY \
// 		wire    [width-1:0] ``src``Iter = src[``src``_i]; \
// 		`GEN_DELAY(clk, rstn, ``src``Iter, width, delay, out[``src``_i]) \
// 	end \
// endgenerate
// `endif

// module test();

// 	reg clk=0;
// 	reg rstn=0;
// 	reg [2:0] source [3:0];
// 	wire [2:0] delay [3:0];

// 	`GEN_DELAY_ARRAY(source,3,4,2,delay)

// 	always #10 clk=~clk;
// 	initial begin
// 		#(30);
// 		rstn=1;
// 		#(30);
// 		source[0]='d1;
// 		source[1]='d2;
// 		source[2]='d3;
// 		source[3]='d4;
// 		#(200) $finish();
// 	end

// 	integer j;
// 	always @(posedge clk)
// 	for(j=0;j<4;j=j+1)
// 		$display("delay%d now %d", j, delay[j]);
	
// 	initial begin
// 		$dumpfile("waveform.vcd");
//         $dumpvars(0, test);
// 	end

// endmodule