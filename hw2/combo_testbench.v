//`timescale 1ns / 1ns 
module testbench; 

   reg a;
	reg b;
	reg c;
	reg d;
	wire  o;

	combo mux(a, b, c, d, o);
  	always #40 a = ~a;
	always #20 b = ~b;
	always #10 c = ~c;
	always #5 d = ~d;
    
    initial begin
		$monitor(" a=0x%0h b=0x%0h c=0x%0h d=0x%0h o=0x%0h", a, b, c, d, o);
		 a = 0;
		 b = 0;
		 c = 0; 
		 d = 0;
		      				       
    end 
endmodule
