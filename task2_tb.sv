module task2_tb;

// Add internal signals here
logic clk, n_reset;
logic [15:0] q;
parameter N = 16'b1010110011100001;
//to be put in loop
int i;

//connect to module
task2 #(N) u1 (q, clk, n_reset);

initial

//Write testbench here

begin

//create clock
clk = '0;

//set n_reset to 0 to initialise
n_reset = '0;
#10ps

//set reset to 1
n_reset = '1;
#10ps

//create for loop (loop forever, include if statements to check first 3 iterations)
//double loop for all clock cycles
for (i = 0; i < 131070; i++);
	begin 
		clk = ~clk;
		#10ps
		//assert initial value at start - triggered at posedge, so when clk = 1
		case(i)
			0: if (q == N) $write("Initial run - PASS"); else $error("Initial run - FAIL");
			2: if (q == 16'b1110001001110000) $write("Iteration 1 - PASS"); else $error("Iteration 1 - FAIL");
			4: if (q == 16'b0111000100111000) $write("Iteration 2 - PASS"); else $error("Iteration 2 - FAIL");
			6: if (q == 16'b0011100010011100) $write("Iteration 3 - PASS"); else $error("Iteration 3 - FAIL");
			default;
		endcase
	end

end

endmodule
