/* Author: Santosh Srivatsan	2017A8PS1924G */
/* SUB-MODULE : SIGN EXTENDER */

module sign_extender(
		input [20:0] unextended,
		output [31:0] extended
		);

	assign extended = { {11{unextended[20]}} , unextended};
endmodule

/*******************************************************************************************************************************************************************/

/* Testbench */

module tb_sign_extender;
	reg [20:0] tb_unextended;
	wire [31:0] tb_extended;
	
	/* Instantiating the sign extender module */
	sign_extender SE(.unextended(tb_unextended), .extended(tb_extended));

	initial #100 $finish;

	initial
	begin
		tb_unextended = 21'b1_0000_1011_0110_1000_0100;
		#10 tb_unextended = 21'b0_1110_1001_0010_0001_1100;
	end
endmodule

/*******************************************************************************************************************************************************************/
