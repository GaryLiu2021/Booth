`ifndef GEN_DELAY
`define GEN_DELAY(iclk, irstn, src, width, ndelay, out) \
GenerateDelaySignal #( \
	.WIDTH(width), \
	.DELAY(ndelay) \
) u_GenerateDelaySignal_``src`` ( \
	.clk(iclk), \
	.rstn(irstn), \
	.source(src), \
	.delay(out) \
);
`endif

// src and out should be wire array
`ifndef GEN_DELAY_ARRAY
`define GEN_DELAY_ARRAY(src, width, depth, delay, out) \
wire [width-1:0] out [depth-1:0]; \
genvar ``src``_i; \
generate \
	for(``src``_i=0;``src``_i<depth;``src``_i=``src``_i+1) begin: GEN_DELAY_ARRAY \
		wire    [width-1:0] ``src``Iter = src[``src``_i]; \
		`GEN_DELAY(clk, rstn, ``src``Iter, width, delay, out[``src``_i]) \
	end \
endgenerate
`endif