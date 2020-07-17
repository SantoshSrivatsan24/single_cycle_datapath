/* Author: Santosh Srivatsan	2017A8PS1924G */
/* SUB-MODULE : ALU */

module alu(
	input signed [31:0] operand1,
	input signed [31:0] operand2,
	/* opcode is actually 'function' in the instruction's opcode */
	input [5:0] opcode,
	output signed [31:0] result
	);

	/* Creating a temporary register for result */
	reg [31:0] reg_result;
	assign result = reg_result;

	always @(operand1 or operand2 or opcode)
	begin
		case(opcode)
			6'b100000 : reg_result = operand1 + operand2;
			6'b100010 : reg_result = operand1 - operand2;
			6'b100100 : reg_result = operand1 & operand2;
			6'b100101 : reg_result = operand1 | operand2;
			6'b000000 : reg_result = operand1 << operand2;
			6'b000010 : reg_result = operand1 >> operand2;
		endcase
	end
endmodule

/*******************************************************************************************************************************************************************/

/* Testbench */

module tb_alu;
	reg signed [31:0] tb_operand1;
	reg signed [31:0] tb_operand2;
	reg [5:0] tb_opcode;
	wire signed [31:0] tb_result;

	/* Instantiating the alu module */
	alu ALU(.operand1(tb_operand1), .operand2(tb_operand2), .opcode(tb_opcode), .result(tb_result));

	initial #100 $finish;

	initial
	begin
		#0  tb_operand1 = 32'h0a ; tb_operand2 = 32'h05 ; tb_opcode = 6'b100000; 
		#10 tb_operand1 = 32'h0a ; tb_operand2 = 32'h1a ; tb_opcode = 6'b100010; 
		#10 tb_operand1 = 32'h0a ; tb_operand2 = 32'h05 ; tb_opcode = 6'b100100; 
		#10 tb_operand1 = 32'h0a ; tb_operand2 = 32'h05 ; tb_opcode = 6'b100101;		 
		#10 tb_operand1 = 32'h0a ; tb_operand2 = 32'h06 ; tb_opcode = 6'b000000;
		#10 tb_operand1 = 32'h0a ; tb_operand2 = 32'h05 ; tb_opcode = 6'b000010;
	end
endmodule 

/*******************************************************************************************************************************************************************/









