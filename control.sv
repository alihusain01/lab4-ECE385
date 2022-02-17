//Two-always example for state machine

module control (input  logic Clk, Reset, Execute, //Reset is Clear,Reset A, Load B
					input logic [7:0] Din, 
                output logic [6:0] HEX0, 
										 HEX1, 
										 HEX2, 
										 HEX3,
										 HEX4, 
										 HEX5,
					output logic [7:0] Aval, Bval, 
					output logic Xval);
	logic LoadA, LoadX, Shift_En, A_Shift_Out, X_Shift_Out, garbage, garbage2, Subtract, X_Data;
	logic [7:0] A_Data;
	logic [8:0] Adder_Sum, MPOut;
	assign Xval = X_Data;
    enum logic [4:0] {A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S}   curr_state, next_state; 
	 

	//updates flip flop, current state is the only one
    always_ff @ (posedge Clk)  
    begin
        if (Reset)
            curr_state <= A;
        else 
            curr_state <= next_state;
    end

    // Assign outputs based on state
	always_comb
    begin
		  next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        case (curr_state) 

            A :    if (Execute)
                       next_state = B;
            B :    next_state = C;
            C :    next_state = D;
            D :    next_state = E;
            E :    next_state = F;
				//CHANGE for 8 bit
				F :    next_state = G;
            G :    next_state = H;
            H :    next_state = I;
            I :    next_state = J;
				J :    next_state = K;
				K :    next_state = L;
				L :    next_state = M;
				M :    next_state = N;
				N :    next_state = O;
				O :    next_state = P;
				P :    next_state = Q;
				Q :    next_state = R;
				
            R :    if (~Execute) 
                       next_state = A;
							  
        endcase
		  
		
		  
   
		  // Assign outputs based on ‘state’
        case (curr_state) 
	   	   A: 
	         begin
            LoadA = 1'b0;
				LoadX = 1'b0;
				Subtract = 1'b0;
				Shift_En = 1'b0;
		      end
				
	   	   B: //add state 1
		      begin
					Shift_En = 1'b0;
					Subtract = 1'b0;
                if(Bval[0] == 1'b1)
					 begin
					 LoadA = 1'b1;
					 LoadX = 1'b1;
					 end
					 else
					 begin
					 LoadA = 1'b0;
					 LoadX = 1'b0;
					 end
				 end
				D: //add state 2
		      begin
					 Shift_En = 1'b0;
					 Subtract = 1'b0;
                if(Bval[0] == 1'b1)
					 begin
					 LoadA = 1'b1;
					 LoadX = 1'b1;
					 end
					 else
					 begin
					 LoadA = 1'b0;
					 LoadX = 1'b0;
					 end
				 end
				F: //add state 3
		      begin
					 Shift_En = 1'b0;
					 Subtract = 1'b0;
                if(Bval[0] == 1'b1)
					 begin
					 LoadA = 1'b1;
					 LoadX = 1'b1;
					 end
					 else
					 begin
					 LoadA = 1'b0;
					 LoadX = 1'b0;
					 end
				 end
				H: //add state 4
		      begin
					 Shift_En = 1'b0;
					 Subtract = 1'b0;
                if(Bval[0] == 1'b1)
					 begin
					 LoadA = 1'b1;
					 LoadX = 1'b1;
					 end
					 else
					 begin
					 LoadA = 1'b0;
					 LoadX = 1'b0;
					 end
				 end
				J: //add state 5
		      begin
					 Shift_En = 1'b0;
					 Subtract = 1'b0;
                if(Bval[0] == 1'b1)
					 begin
					 LoadA = 1'b1;
					 LoadX = 1'b1;
					 end
					 else
					 begin
					 LoadA = 1'b0;
					 LoadX = 1'b0;
					 end
				end
				L: //add state 6
		      begin
					 Shift_En = 1'b0;
					 Subtract = 1'b0;
                if(Bval[0] == 1'b1)
					 begin
					 LoadA = 1'b1;
					 LoadX = 1'b1;
					 end
					 else
					 begin
					 LoadA = 1'b0;
					 LoadX = 1'b0;
					 end
				end
				N: //add state 7
		      begin
					 Shift_En = 1'b0;
					 Subtract = 1'b0;
                if(Bval[0] == 1'b1)
					 begin
					 LoadA = 1'b1;
					 LoadX = 1'b1;
					 end
					 else
					 begin
					 LoadA = 1'b0;
					 LoadX = 1'b0;
					 end
				end
				P: //subtract state
		      begin
					 Shift_En = 1'b0;
					 Subtract = 1'b1;
                if(Bval[0] == 1'b1)
					 begin
					 LoadA = 1'b1;
					 LoadX = 1'b1;
					 end
					 else
					 begin
					 LoadA = 1'b0;
					 LoadX = 1'b0;
					 end
				end
				R: //hold state
		      begin
					 Shift_En = 1'b0;
					 Subtract = 1'b0;
					 LoadA = 1'b0;
					 LoadX = 1'b0;
				end
					 
	   	   default:  //default case, SHIFT
		      begin 
               LoadA = 1'b0;
					LoadX = 1'b0;
					Subtract = 1'b0;
					
					Shift_En = 1'b1;
		      end
        endcase
    end
  //Instantiate necessary modules

		  
		  reg_1 REG_X(.Clk(Clk), .Reset(Reset), .Shift_In(X_Data), .Load(LoadX), 
							.Shift_En(Shift_En), .D(Adder_Sum[8]), .Shift_Out(X_Shift_Out), .Data_Out(X_Data));
		  
		  reg_8 REG_A(.Clk(Clk), .Reset(Reset), .Shift_In(X_Shift_Out), .Load(LoadA), 
							.Shift_En(Shift_En), .D(Adder_Sum[7:0]), .Shift_Out(A_Shift_Out), .Data_Out(A_Data));
							
		  assign Aval = A_Data;
							
		  reg_8 REG_B(.Clk(Clk), .Reset(1'b0), .Shift_In(A_Shift_Out), .Load(Reset), 
							.Shift_En(Shift_En), .D(Din), .Shift_Out(garbage), .Data_Out(Bval));
							
		  multiplexer MP(.sub(Subtract), .S0(Din), .Sout(MPOut));
		  
		  nineBitAdder add(.S(MPOut), .A({A_Data[7], A_Data}), .cin(Subtract), .out(Adder_Sum), .X(garbage2));
		  
		  
//		  HexDriver display[3:0](
//		  .In0({Aval[7:4], Aval[3:0], Bval[7:4], Bval[3:0]}),
//		  .Out0({HEX3, HEX2, HEX1, HEX0})
//		  );

			HexDriver display[5:0](
		  .In0({Aval[7:4], Aval[3:0], Bval[7:4], Bval[3:0], Din[7:4], Din[3:0]}),
		  .Out0({HEX5, HEX4, HEX3, HEX2, HEX1, HEX0})
		  );
		   
		  
		  
endmodule