module task1_tb;

//Use these for the inputs.
logic a,b,c;

//Use these two signals for the outputs
logic [1:0] y_structural, y_other;

// Instantiate both UUT
task1a u1 (y_structural, a, b, c);
task1b u2 (y_other, a, b, c);

initial
begin
	//Write your testbench here
	
	//go through all possible values, assert each
	//list all possible combinations + assert individual y values + assert if y is equal

	{a, b, c} = 3'b000;
	#10ps
	assert (y_structural == 2'b00) $display("1A - PASS"); else $error("1A - FAIL");
	assert (y_other == 2'b00) $display("1B - PASS"); else $error("1B - FAIL");
	assert (y_structural == y_other) $display("PASS"); else $error ("FAIL");
	
	{a, b, c} = 3'b001;
	#10ps
	assert (y_structural == 2'b01) $display("1A - PASS"); else $error("1A - FAIL");
	assert (y_other == 2'b01) $display("1B - PASS"); else $error("1B - FAIL");
	assert (y_structural == y_other) $display("PASS"); else $error ("FAIL");
	
	{a, b, c} = 3'b010;
	#10ps
	assert (y_structural == 2'b01) $display("1A - PASS"); else $error("1A - FAIL");
	assert (y_other == 2'b01) $display("1B - PASS"); else $error("1B - FAIL");
	assert (y_structural == y_other) $display("PASS"); else $error ("FAIL");
	
	{a, b, c} = 3'b011;
	#10ps
	assert (y_structural == 2'b10) $display("1A - PASS"); else $error("1A - FAIL");
	assert (y_other == 2'b10) $display("1B - PASS"); else $error("1B - FAIL");
	assert (y_structural == y_other) $display("PASS"); else $error ("FAIL");
	
	{a, b, c} = 3'b100;
	#10ps
	assert (y_structural == 2'b01) $display("1A - PASS"); else $error("1A - FAIL");
	assert (y_other == 2'b01) $display("1B - PASS"); else $error("1B - FAIL");
	assert (y_structural == y_other) $display("PASS"); else $error ("FAIL");
	
	{a, b, c} = 3'b101;
	#10ps
	assert (y_structural == 2'b10) $display("1A - PASS"); else $error("1A - FAIL");
	assert (y_other == 2'b10) $display("1B - PASS"); else $error("1B - FAIL");
	assert (y_structural == y_other) $display("PASS"); else $error ("FAIL");
	
	{a, b, c} = 3'b110;
	#10ps
	assert (y_structural == 2'b10) $display("1A - PASS"); else $error("1A - FAIL");
	assert (y_other == 2'b10) $display("1B - PASS"); else $error("1B - FAIL");
	assert (y_structural == y_other) $display("PASS"); else $error ("FAIL");
	
	{a, b, c} = 3'b111;
	#10ps
	assert (y_structural == 2'b11) $display("1A - PASS"); else $error("1A - FAIL");
	assert (y_other == 2'b11) $display("1B - PASS"); else $error("1B - FAIL");
	assert (y_structural == y_other) $display("PASS"); else $error ("FAIL");
	
end

endmodule

