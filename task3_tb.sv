module task3_tb;

//Write testbench here

//set inputs/outputs/parameters
logic CLK;
int Q;
parameter N = 8'b11100011;	//any number will do
//reference module
task3 #(N) u1 (Q, CLK);

//create clock
initial
begin
#10ps
CLK <= '0;
forever
	begin
	#10ps CLK <= ~CLK;
	//display updated Q value
	$display("%d", Q);
	end
//after value ends, check Q depending on input value
$display("FINAL: %d", Q);

end

endmodule
