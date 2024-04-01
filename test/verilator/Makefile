wave_dir=./wave/

booth:
	verilator --timing -Wno-fatal --trace -cc -exe -build ../testbench/booth_test.v ../../src/booth/*.v booth_test.cpp
	@echo "\n\n\tSimulation Begin!\n\n"
	./obj_dir/Vbooth_test
	@echo "\n\n\tSimulation Finished!\n\n"
	mv -i -v *.vcd ${wave_dir}
