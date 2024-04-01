OBJPATH=./out
booth_src=./src/booth/*.v ./test/testbench/booth_test.v
booth: ${booth_src}
	iverilog -o ${OBJPATH}/$@ $^
	vvp ./out/booth