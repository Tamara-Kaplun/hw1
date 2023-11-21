//`timescale 1ns / 1ns 
module testbench; 

   reg clk, rstn, d;
	wire [3:0] out;	

	integer i; 

	
	lshift_4b_reg u0(.d(d), .clk(clk), .rstn(rstn), .out(out));

   always #10 clk = ~clk;
	
   initial begin
		
		{clk, rstn, d} <= 0;
		
		#10 rstn <= 1;
	 
		for (i = 0; i < 20; i = i + 1) begin
			@(posedge clk) d <= $random;
		end		
		
		#10 $finish;
    end 
endmodule