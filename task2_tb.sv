module task2_tb;

// Add internal signals here
logic clk, n_reset;
logic [15:0] q;
parameter N = 16'b1010110011100001;

//connect to module
task2 #(N) u1 (q, clk, n_reset);

initial

//Write testbench here

//create clock
#(10ps);
clk = '0;

//set n_reset to 0 to initialise
#(10ps);
n_reset = '0;

//set reset to 1
#(10ps);
n_reset = '1;

//create for loop (loop forever, include if statements to check first 3 iterations)
//double loop for all clock cycles

generate for (genvar i = 0; i < 131070; i++)
	begin
		#(10ps) 
		clk = ~clk;
		//assert initial value at start - triggered at posedge, so when clk = 1
		case(i)
			0: if (q == N) $info("Initial run - PASS"); else $error("Initial run - FAIL");
			2: if (q == 16'b1110001001110000) $info("Iteration 1 - PASS"); else $error("Iteration 1 - FAIL");
			4: if (q == 16'b0111000100111000) $info("Iteration 2 - PASS"); else $error("Iteration 2 - FAIL");
			6: if (q == 16'b0011100010011100) $info("Iteration 3 - PASS"); else $error("Iteration 3 - FAIL");
			default;
		endcase
	end
endgenerate

endmodule
