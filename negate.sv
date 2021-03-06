module negate(input logic [7:0] in0,
					output logic [7:0] out0);
					
logic [7:0] temp, tempOut;

full_adder FA0 (.x(in0[0]), .y(1'b1), .z(1'b0), .s(tempOut[0]), .c(temp[0]));
full_adder FA1 (.x(in0[1]), .y(1'b1), .z(1'b0), .s(tempOut[1]), .c(temp[1]));
full_adder FA2 (.x(in0[2]), .y(1'b1), .z(1'b0), .s(tempOut[2]), .c(temp[2]));
full_adder FA3 (.x(in0[3]), .y(1'b1), .z(1'b0), .s(tempOut[3]), .c(temp[3]));
full_adder FA4 (.x(in0[4]), .y(1'b1), .z(1'b0), .s(tempOut[4]), .c(temp[4]));
full_adder FA5 (.x(in0[5]), .y(1'b1), .z(1'b0), .s(tempOut[5]), .c(temp[5]));
full_adder FA6 (.x(in0[6]), .y(1'b1), .z(1'b0), .s(tempOut[6]), .c(temp[6]));
full_adder FA7 (.x(in0[7]), .y(1'b1), .z(1'b0), .s(tempOut[7]), .c(temp[7]));

logic cout;
logic temp1;

fourbitRippleAdder RA0(.A(tempOut[3:0]), .B(4'b0001), .cin(1'b0), .S(out0[3:0]), .cout(cout));
fourbitRippleAdder RA1(.A(tempOut[7:4]), .B(4'b0000), .cin(cout), .S(out0[7:4]), .cout(temp1)); //check proper X later
				
endmodule
