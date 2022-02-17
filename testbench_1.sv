module testbench_1();
timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

logic  Clk, Reset, Execute, Xval;
logic [7:0] Din, Aval, Bval;
logic [6:0] HEX0, HEX1, HEX2, HEX3;

control CT(.Clk(Clk), .Reset(Reset), .Execute(Execute), .Din(Din), .HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), 
.HEX3(HEX3), .Aval(Aval), .Bval(Bval), .Xval(Xval));

logic [4:0] state;
assign state = CT.curr_state;

always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

//module control (input  logic Clk, Reset, Execute, //Reset is Clear,Reset A, Load B
//					input logic [7:0] Din, 
//                output logic [6:0] HEX0, 
//										 HEX1, 
//										 HEX2, 
//										 HEX3, 
//					output logic [7:0] Aval, Bval, 
//					output logic Xval);


initial begin: TEST_VECTORS

//Din = 8'b11000101;
Din = 8'b00001000;
#1 Reset = 1'b1;
#2 Reset = 1'b0;
//#3 Din = 8'b00000111;
#3 Din = 8'b11111110;
#4 Execute = 1'b1;
	
end
endmodule
