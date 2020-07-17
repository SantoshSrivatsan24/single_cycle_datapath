/* Author: Santosh Srivatsan	2017A8PS1924G */
/* PROCESSOR STAGE : EXECUTE STAGE */

module execute(
		input [5:0] function_code,
		input [31:0] data1, data2,
		input [4:0] shamt,
		input [20:0] constant,
		input ALUSrc,
		output [31:0] result, extended_constant
		);

	wire [31:0] wire_operand1, wire_operand2;
	assign wire_operand1 = data1;
	mux_2_1_modified M21(.d0(shamt), .d1(data2), .s(ALUSrc), .y(wire_operand2));
	alu ALU(.operand1(wire_operand1), .operand2(wire_operand2), .opcode(function_code), .result(result));
	sign_extender SE(.unextended(constant), .extended(extended_constant));
endmodule

/*******************************************************************************************************************************************************************/

/* Testbench */

module tb_execute;
	reg [5:0] tb_function_code;
	reg [31:0] tb_data1, tb_data2;
	reg [4:0] tb_shamt;
	reg [20:0] tb_constant;
	reg tb_ALUSrc;
	wire [31:0] tb_result, tb_extended_constant;

	/* Instantiating the execution stage */
	execute EX(.function_code(tb_function_code), .data1(tb_data1), .data2(tb_data2), .shamt(tb_shamt), .constant(tb_constant), .ALUSrc(tb_ALUSrc), .result(tb_result), .extended_constant(tb_extended_constant));
	
	initial #100 $finish;
	
	initial
	begin
		tb_function_code = 6'b100000 ; tb_data1 = 32'h10 ; tb_data2 = 32'h20 ; tb_shamt = 5'h01 ; tb_constant = 21'h30 ; tb_ALUSrc = 1'b1;
	end
endmodule

/*******************************************************************************************************************************************************************/



























