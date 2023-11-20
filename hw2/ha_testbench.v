//`timescale 1ns / 1ns 
module testbench; 

   reg a;
	reg b;


	wire  sum, cout;
	integer i; 

	
	ha u0(.a(a), .b(b), .sum(sum), .cout(cout));

    
   initial begin
			
		a <= 0;
		b <= 0;
	 
		$monitor(" a=%0b b=%0b sum=%0b cout=%0b", a, b, sum, cout);
		for (i = 0; i < 4; i = i + 1) begin
				{a, b} = i;
				#10;
		end     
    end 
endmodule