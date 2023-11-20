//`timescale 1ns / 1ns 
module testbench; 

   reg a;
	reg b;
	reg sel; 


	wire  c;
	integer i; 

	
	mux_2x1 u0(.a(a), .b(b), .sel(sel), .c(c));

    
   initial begin
			
		a <= 0;
		b <= 0;
		sel <= 0;
	 
		$monitor(" a=%0b b=%0b sel=%0b c=%0b", a, b, sel, c);
		for (i = 0; i < 3; i = i + 1) begin
				{a, b, sel} = i;
				#10;
		end     
    end 
endmodule