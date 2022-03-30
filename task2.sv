
module task2 #(parameter N=16'b1010110011100001) (output logic [15:0] Q, input logic CLK, n_RESET);

//Write solution here

/*
Explanation of all variables:
N - original value to be entered into array
Q - array to insert everything
CLK - clock, edge triggered
n_RESET - if 0, do nothing
*/

//begin execution
initial
//always activate if CLK goes high or reset changes
always_ff @ (posedge CLK, negedge n_RESET)
	//if reset, takes priority over all
	if (~n_RESET)
		//if reset is activated, do nothing
		Q <= '0;
	//otherwise, reset will be high, so if clock has hit edge
	else
		


endmodule