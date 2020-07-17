/* Author: Santosh Srivatsan	2017A8PS1924G */
/* DATAPATH */

module datapath(
		input clk,
		input reset
		);

	/* Connections between IF and ID */
	wire [31:0] wire_instruction;

	/* Connections between ID and EX */
	wire [5:0] wire_function_code;
	wire [31:0] wire_data1, wire_data2;
	wire [4:0] wire_shamt;
	wire [20:0] wire_constant;
	wire ALUSrc, ALUtoReg;

	/* Connections between EX and WB */
	wire [31:0] alu_result, extended_constant, result;

	/* Instantiating the IF module */
	instruction_fetch IF(.clk(clk), .reset(reset), .instruction(wire_instruction));

	/* Instantiating the ID module */
	instruction_decode ID(.instruction(wire_instruction), .write_data(result), .function_code(wire_function_code), .data1(wire_data1), 
.data2(wire_data2), .shamt(wire_shamt), .constant(wire_constant), .ALUSrc(ALUSrc), .ALUtoReg(ALUtoReg));

	/* Instantiating the EX module */
	execute EX(.function_code(wire_function_code), .data1(wire_data1), .data2(wire_data2), .shamt(wire_shamt), .constant(wire_constant), 
.ALUSrc(ALUSrc), .result(alu_result), .extended_constant(extended_constant));

	/* Instantiating the WB module */
	write_back WB(.alu_result(alu_result), .extended_constant(extended_constant), .ALUtoReg(ALUtoReg), .result(result));
endmodule

/*******************************************************************************************************************************************************************/

/* Testbench */

module tb_datapath;
	reg tb_clk, tb_reset;

	/* Instantiating the datapath module */
	datapath DATAPATH(.clk(tb_clk), .reset(tb_reset));

	/* Clock generation */
	always
	begin
		tb_clk = 0;
		#5;
		tb_clk = 1;
		#5;
	end

	initial #200 $finish;
	
	initial
	begin
		tb_reset = 0;
		#10 tb_reset = 1;
		#10 tb_reset = 0;
	end
endmodule
		
/*******************************************************************************************************************************************************************/	






	