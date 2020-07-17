/* Author: Santosh Srivatsan	2017A8PS1924G */
/* PROCESSOR STAGE : WRITE BACK STAGE */

module write_back(
		input [31:0] alu_result, extended_constant,
		input ALUtoReg,
		output [31:0] result
		);

		mux_2_1 M21(.d0(extended_constant), .d1(alu_result), .s(ALUtoReg), .y(result));
endmodule

/*******************************************************************************************************************************************************************/