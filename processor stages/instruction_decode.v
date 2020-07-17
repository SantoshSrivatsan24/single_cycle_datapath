/* Author: Santosh Srivatsan	2017A8PS1924G */
/* PROCESSOR STAGE : INSTRUCTION DECODE STAGE */

module instruction_decode(
		input [31:0] instruction, write_data,
		output [5:0] function_code,
		output [31:0] data1, data2,
		output [4:0] shamt,
		output [20:0] constant,
		output ALUSrc, ALUtoReg
		);

	wire [5:0] wire_opcode = instruction[31:26];	
	wire [5:0] wire_function_code = instruction[5:0];
	wire [4:0] wire_rs1 = instruction[20:16];
	wire [4:0] wire_rs2 = instruction[15:11];
	wire [4:0] wire_rd = instruction[25:21];
	wire [4:0] wire_shamt = instruction[10:6];
	wire [20:0] wire_constant = instruction[20:0];

	assign function_code = wire_function_code;
	assign shamt = wire_shamt;
	assign constant = wire_constant;

	register_file RF(.rs1(wire_rs1), .rs2(wire_rs2), .rd(wire_rd), .write_data(write_data), .data1(data1), .data2(data2));
	control_unit CU(.opcode(wire_opcode), .function_code(wire_function_code), .ALUSrc(ALUSrc), .ALUtoReg(ALUtoReg));
endmodule

/*******************************************************************************************************************************************************************/

/* Testbench */

module tb_instruction_decode;
	reg [31:0] tb_instruction, tb_write_data;
	wire [5:0] tb_function_code;
	wire [31:0] tb_data1, tb_data2;
	wire [4:0] tb_shamt;
	wire [20:0] tb_constant;
	wire tb_ALUSrc, tb_ALUtoReg;

	/* Instantiating the ID module */
	instruction_decode ID(.instruction(tb_instruction), .write_data(tb_write_data), .function_code(tb_function_code), .data1(tb_data1), .data2(tb_data2), .shamt(tb_shamt), .constant(tb_constant), .ALUSrc(tb_ALUSrc), .ALUtoReg(tb_ALUtoReg));

	initial #100 $finish;
	
	initial
	begin
		tb_instruction = 32'hfc00001a ; tb_write_data = 32'h50607080;
		#10 tb_instruction = 32'h00011020 ; tb_write_data = 32'hfff34ff7;
	end
endmodule

/*******************************************************************************************************************************************************************/
	

		
