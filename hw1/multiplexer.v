module multiplexer (input [4:0] a, input [4:0] b,input [4:0] c,input [4:0] d,input [4:0] e, input[2:0] sel, 
							output reg [4:0]  out); 
    always @ (a or b or c or d or sel) begin
		 case (sel)
			2'b000: out <= a;
			2'b001: out <= b;
			2'b010: out <= c;
			2'b011: out <= d;
			2'b100: out <= e;

		 endcase
	 end
	 
    
endmodule