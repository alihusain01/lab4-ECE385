//module reg_1 (input  logic Clk, Reset, Load, Shift_En,
//              input  logic  D,
//              output logic Data_Out);
//				  
//		logic data_n, data;
//		assign Data_Out = data;
//    always_ff @ (posedge Clk)
//    begin
//	 	 data <= data_n;
//    end
//	 
//	 always_comb
//	 begin
//		data_n = data;
//		if(Reset) begin
//			data_n = '0;
//		end else if(Load) begin
//			data_n = D;
//		end
//	 end
//	
//endmodule

module reg_1 (input  logic Clk, Reset, Shift_In, Load, Shift_En,
              input  logic  D,
              output logic Shift_Out,
              output logic Data_Out);

    always_ff @ (posedge Clk)
    begin
	 	 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
			  Data_Out <= 1'b0;
		 else if (Load)
			  Data_Out <= D;
		 else if (Shift_En)
		 begin
			  //concatenate shifted in data to the previous left-most 7 bits
			  //note this works because we are in always_ff procedure block
			  Data_Out <=Shift_In; 
	    end
    end
	
    assign Shift_Out = Data_Out;

endmodule
