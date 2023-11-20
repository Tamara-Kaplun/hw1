//`timescale 1ns / 1ns 
module testbench; 

   reg a;
	reg b;
	reg c;
	reg d;
	reg e;

	wire  z;
	integer i; 

	
	combo_2 u0(.a(a), .b(b), .c(c), .d(d), .e(e), .z(z));

    
   initial begin
			
		a <= 0;
		b <= 0;
		c <= 0; 
		d <= 0;
		e <= 0;
		 
		$monitor(" a=%0b b=%0b c=%0b d=%0b e=%0b z=%0b", a, b, c, d, e, z);
		for (i = 0; i < 32; i = i + 1) begin
				{a, b, c, d, e} = i;
				#10;
		end     
    end 
endmodule