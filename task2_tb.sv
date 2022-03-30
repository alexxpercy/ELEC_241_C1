module task2_tb;

// Add internal signals here
logic clk, n_reset;
logic [15:0] q;
parameter N = 16'b1010110011100001;

//connect to module
task2 u1 #(N)(q, clk, n_reset);

initial begin

//Write testbench here

//create clock
clk = '0;

//set n_reset to 0 to initialise
#10ps
n_reset = '0;

//set reset to 1
#10ps
n_reset = '1;

end

//create for loop (loop forever, include if statements to check first 3 iterations)
//double loop for all clock cycles
generate for (genvar i = 0; i < 131070; i++)
	begin
		//invert clock, trigger rising or falling edge
		assign #10ps clk = ~clk;
		//assert initial value at start - triggered at posedge, so when clk = 1
		case(i)
			0: assert (q == N) $display("Initial run - PASS"); else $error("Initial run - FAIL");
			2: assert (q == 16'b1110001001110000) $display("Iteration 1 - PASS"); else $error("Iteration 1 - FAIL");
			4: assert (q == 16'b0111000100111000) $display("Iteration 2 - PASS"); else $error("Iteration 2 - FAIL");
			6: assert (q == 16'b0011100010011100) $display("Iteration 3 - PASS"); else $error("Iteration 3 - FAIL");
			default;
	end
endgenerate


endmodule
