//`timescale 1ns / 1ns 
module testbench; 

   reg d;
   reg clk;
   reg rstn;
   wire  out;

	ttf mux(d, clk, rstn, out);
   always #5 clk = ~clk;
	always #50 rstn = ~rstn;
	always #30 d = ~d;
    
    initial begin		
	d = 0;
	clk = 0; 
	rstn = 0;
			       
    end 
endmodule
