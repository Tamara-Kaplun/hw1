//`timescale 1ns / 1ns 
module testbench; 

   reg j, k, rstn, clk;
	reg [2:0] dly;
	wire  q;	

	integer i; 
	always #10 clk = ~clk;
	
	jk_ff u0(.j(j), .k(k), .clk(clk), .rstn(rstn), .q(q));

   initial begin
		{j, k, rstn, clk} <= 0;
		#10 rstn <= 1;
		
					
	 
		for (i = 0; i < 10; i = i + 1) begin
			dly = $random;
			#(dly) j <= $random;
			#(dly) k <= $random;
		end		
		#20 $finish;
    end 
endmodule