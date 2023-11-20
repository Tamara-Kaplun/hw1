module combo_2 (input a, 
				  input	b,
				  input	c,
				  input	d,
				  input	e,
				  output reg z);
	always @(a or  b or c or d or e) begin
		z = ((a & b) | (c^d) & (~e)); 
	end
endmodule