//`timescale 1ns / 1ns 
module testbench; 

   reg a;
	reg b;
	reg cin; 


	wire  sum, cout;
	integer i; 

	
	fa u0(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    
   initial begin
			
		a <= 0;
		b <= 0;
	 
		$monitor(" a=%0b b=%0b cin=%0b sum=%0b cout=%0b", a, b, cin, sum, cout);
		for (i = 0; i < 8; i = i + 1) begin
				{a, b, cin} = i;
				#10;
		end     
    end 
endmodule