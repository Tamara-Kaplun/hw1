//`timescale 1ns / 1ns 
module testbench; 

   reg [4:0] a;
	reg [4:0] b;
	reg [4:0] c;
	reg [4:0] d;
	reg [4:0] e;
	reg [2:0] sel; 
	wire [4:0]  out;
	integer i;
	
	multiplexer mux(.a(a), .b(b), .c(c), .d(d), .e(e), .sel(sel), .out(out));
    
    
    initial begin
        $monitor("[%0t] sel=0x%0h a=0x%0h b=0x%0h c=0x%0h d=0x%0h e=0x%0h out=0x%0h",$time, sel, a, b, c, d, e, out);
			
			sel <= 0;
			a <= $random;
			b <= $random;
			c <= $random;
			d <= $random;
			e <= $random; 
			
			for (i = 1; i < 5; i = i + 1 ) begin
			#5 sel <= i;
			end
			//#6 $finish;
        
    end 
endmodule