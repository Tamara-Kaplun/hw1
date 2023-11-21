//`timescale 1ns / 1ns 
module testbench; 

   reg  rstn, clk;
	wire [3:0] out;
	
	
	
	mod10_counter u0( .clk(clk), .rstn(rstn), .out(out));
	always #10 clk = ~clk;

   initial begin
		{clk, rstn} <= 0;
		#10 rstn <= 1;
		#450 $finish;

    end 
endmodule