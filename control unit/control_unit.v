/* Author: Santosh Srivatsan	2017A8PS1924G */
/* SUB-MODULE : CONTROL UNIT */

module control_unit(
		input [5:0] opcode,
		input [5:0] function_code,
		output ALUSrc,
		output ALUtoReg
		);

	/* opcode for r-type instructions : 000 000
	   opcode for i-type instructions : 111 111 */

	/* ALUSrc = 1 : use data2 as operand2 (r-type)
	   ALUSrc = 0 :  use shamt as operand2 (r-type)
	   Since both instructions are r-type, we use function_code to decide ALUSrc */
	assign ALUSrc = function_code[5] ? 1'b1 : 1'b0;

	/* ALUtoReg = 1 : write back result of ALU (r-type)
	   ALUtoReg = 0 : write back result of sign-extender (i-type)
	   Since one instruction is r-type and the other is i-type, we use opcode to decide ALUtoReg*/
	assign ALUtoReg = opcode[0] ? 1'b0 : 1'b1;
endmodule

/*******************************************************************************************************************************************************************/

/* Testbench */

module tb_control_unit;
	reg [5:0] tb_opcode;
	wire tb_ALUSrc;
	wire tb_ALUtoReg;

	/* Instantiating the control unit module */
	control_unit CU(.opcode(tb_opcode), .ALUSrc(tb_ALUSrc), .ALUtoReg(tb_ALUtoReg));

	initial #100 $finish;

	initial 
	begin
		tb_opcode = 6'b000000;
		#10 tb_opcode = 6'b111111;
	end
endmodule

/*******************************************************************************************************************************************************************/
