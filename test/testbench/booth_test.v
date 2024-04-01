module booth_test;

// booth_multiplier Parameters
parameter PERIOD  = 10;


// booth_multiplier Inputs
reg   [31:0]  multiplicand  = 0;
reg   [31:0]  multiplier    = 0;

// booth_multiplier Outputs
wire  [63:0]  result;


booth_multiplier  u_booth_multiplier (
    .multiplicand            ( random_in0 [31:0] ),
    .multiplier              ( random_in1 [31:0] ),

    .result                  ( result     [63:0] )
);

reg pass = 0;
reg [31:0] random_in0, random_in1;

task automatic figure;
    input [31:0] x0;
    input [31:0] x1;

    reg [63:0] dout;

    begin
        #(1); // wait for calculator
        dout = $signed(x0) * $signed(x1);
        pass = ($signed(dout) == $signed(result));
        if(pass)
            $display("%d * %d = %d", $signed(x0), $signed(x1), $signed(dout));
        else begin
            $display("%d * %d\nshould be:\t%b\nbut:\t\t%b", $signed(x0), $signed(x1), $signed(dout), $signed(result));
            $stop;
        end
    end
endtask

initial
begin
    repeat(1000000) begin
        random_in0 = $random;
        random_in1 = $random;
        figure(random_in0, random_in1);
        #(10);
    end
    $display("In 1000000 test cases, it passed!");
    $finish;
end


`ifdef __VCD_OUT
    initial
    begin            
        $dumpfile("wave.vcd");
        $dumpvars(0, booth_test);
    end
`endif

endmodule
