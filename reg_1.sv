module reg_1 (input  logic Clk, Reset, Load, Shift_En,
              input  logic  D,
              output logic Data_Out);
				  
		logic data_n, data;
		assign Data_Out = data;
    always_ff @ (posedge Clk)
    begin
	 	 data <= data_n;
    end
	 
	 always_comb
	 begin
		data_n = data;
		if(Reset) begin
			data_n = '0;
		end else if(Load) begin
			data_n = D;
		end
	 end
	
endmodule
