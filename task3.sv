// Task 3 - 2022
/*
N - parameter to be passed when tested
Q - reg to be able to take a value from arithmetic
CLK - clock, used for synchronous restarts
*/
module task3 #(parameter N)(output int Q, input logic CLK );

//Write solution here

//internal variables
logic START;		//needs to be HIGH, triggered by clock edge
logic VALID;		//LOW until finished counting, HIGH when stopping
logic [7:0] DATAIN;	//to contain N in
int i;			//counter for each value in array

initial
begin

//set value for Q (should be 0 to begin with)
Q <= 1'd0;	//decimal to be able to count
//set valid as LOW to make sure values can be counted
VALID <= '0;
//assign N to array
DATAIN <= N;
//set i to count down from most significant
i <= 7;

@ (posedge CLK)	//until rising edge
	START <= '1;	//synchronous with clock
	//if valid is still low, value can be counted
	if (~VALID)
		if (DATAIN[i] == 1)
			begin
			//add to counter
			Q <= Q + 1;
			i <= i - 1;	//take away to move down array
			end
		else if (DATAIN[i] == 0)
			begin
			//set valid as HIGH to stop counting
			VALID <= '1;
			//latch Q
			Q <= Q;
			//display final count
			$display("Number of 1's: %d", Q);
			end

end

endmodule
