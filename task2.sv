
module task2 #(parameter N=16'b1010110011100001) (output logic [15:0] Q, input logic CLK, n_RESET);

//Write solution here

/*
Explanation of all variables:
N - original value to be entered into array
Q - array to insert everything
CLK - clock, edge triggered
n_RESET - if 0, do nothing
*/

//name internal variables
//bits to be XOR-ed and put into new place
logic xor_14;	//to go to bit 13
logic xor_13;	//to go to bit 12
logic xor_11;	//to go to bit 10
//create feedback bit to be passed back
logic feedback_bit;
int i;

//begin execution
initial
begin

//always activate if CLK goes high or reset changes
 @ (posedge CLK, negedge n_RESET)
	//if reset, takes priority over all
	if (~n_RESET)
		//if reset is activated, do nothing
		Q <= '0;
	//otherwise, reset will be high, so if clock has hit edge
	else
	
Q <= N;
		//create FOR loop for all combinations - 2^n - 1 = 65535
		for(i = 0; i < 65535; i++) 
		begin
			//set feedback bit as first value
			feedback_bit = Q & 1;
			//find xor values
			xor_14 <= (Q ^ (Q >> 14)) & 1;
			xor_13 <= (Q ^ (Q >> 13)) & 1;
			xor_11 <= (Q ^ (Q >> 11)) & 1;
			//shift all to right and OR all xor bits to left, set feedback bit to start of array
			Q <= (Q >> 1) | (feedback_bit << 15) | (xor_14 << 13) | (xor_13 << 12) | (xor_11 << 10);
		end
end


endmodule