/* Author: Santosh Srivatsan	2017A8PS1924G */
/* SUB-MODULE : 2:1 MUX with 32-bit inputs */

module mux_2_1(
		input [31:0] d0, d1,
		input s,
		output [31:0] y
		);

	/* Creating a temporary register for the output y */
	reg [31:0] reg_y;
	assign y = reg_y;	
	
	always @(d0 or d1 or s)
	begin
		if(s)
			reg_y = d1;
		else
			reg_y = d0;
	end
endmodule

/*******************************************************************************************************************************************************************/

/* Testbench */

module tb_mux_2_1;
	reg [31:0] tb_d0, tb_d1;
	reg tb_s;
	wire [31:0] tb_y;

	mux_2_1 M21(.d0(tb_d0), .d1(tb_d1), .s(tb_s), .y(tb_y));

	initial #100 $finish;

	initial
	begin
		tb_d0 = 5'd10 ; tb_d1 = 32'd20 ; tb_s = 0;
		#10 tb_d0 = 5'd20 ; tb_d1 = 32'd100 ; tb_s = 1;
	end
endmodule

/*******************************************************************************************************************************************************************/
