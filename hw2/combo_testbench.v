//`timescale 1ns / 1ns 
module testbench; 

   reg a;
	reg b;
	reg c;
	reg d;

	wire  o;

	
	combo mux(a, b, c, d, o);
   always #5 a = ~a;
	always #10 b = ~b;
	always #20 c = ~c;
	always #40 d = ~d;
    
    initial begin
        //$monitor("[%0t] d=0x%0h clk=0x%0h rstn=0x%0h out=0x%0h",$time, d, clk, rstn, out);
			
		 a = 0;
		 b = 0;
		 c = 0; 
		 d = 0;
			       
    end 
endmodule