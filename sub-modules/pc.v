/* Author: Santosh Srivatsan	2017A8PS1924G */
/* SUB-MODULE : PC */

module pc(
	input [31:0] address_in,
	input clk,
	input reset,
	output [31:0] address_out
	);

	reg [31:0] PC;
	assign address_out = PC;

	always @(posedge clk)
	begin
		if(reset)
			PC = 32'h00;
		else
			PC = address_in;
	end
endmodule

/*******************************************************************************************************************************************************************/

/* Testbench */

module tb_pc;
	reg [31:0] tb_address_in;
	reg tb_clk;
	reg tb_reset;
	wire [31:0] tb_address_out;

	/* Instantiating the PC module */
	pc PC(.address_in(tb_address_in), .clk(tb_clk), .reset(tb_reset), .address_out(tb_address_out));
			
	initial #100 $finish;

	/* Clock generation */
	always
	begin
		tb_clk = 0;
		#5;
		tb_clk = 1;
		#5;
	end
	
	initial 
	begin
		tb_reset = 0 ; tb_address_in = 32'h00102030;
		#10 tb_reset = 1 ; tb_address_in = 32'h40506070;
		#10 tb_reset = 0 ; tb_address_in = 32'h80901020;
	end
endmodule

/*******************************************************************************************************************************************************************/