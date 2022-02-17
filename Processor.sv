module Processor(input  logic Clk, Reset, Execute, //Reset is Clear,Reset A, Load B
					input logic [7:0] Din, 
                output logic [6:0] HEX0, 
										 HEX1, 
										 HEX2, 
										 HEX3,
										 HEX4, 
										 HEX5,
					output logic [7:0] Aval, Bval, 
					output logic Xval);
					
logic Execute_Inverted, Reset_Inverted;
					
always_comb
begin					
Execute_Inverted = ~Execute;
Reset_Inverted = ~Reset;
end

control C(.Clk(Clk), .Reset(Reset_Inverted), .Execute(Execute_Inverted), .Din(Din), 
	.HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3), .HEX4(HEX4), .HEX5(HEX5),
	.Aval(Aval), .Bval(Bval), .Xval(Xval));
					
endmodule
