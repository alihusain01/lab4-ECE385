module multiplexer(input logic sub, 
						input logic [7:0] S0, 
						output logic [8:0] Sout);
	logic [7:0] negated_S;
	negate N0(.in0(S0), .out0(negated_S));

	
	always_comb
	begin
		if (sub == 0)
		begin
		Sout = {S0[7], S0};
		end
		
		else
		begin
		Sout = {~S0[7], ~S0};
		end	
	end	

endmodule
