/* Author: Santosh Srivatsan	2017A8PS1924G */
/* PROCESSOR STAGE : INSTRUCTION FETCH STAGE */

module instruction_fetch(
		input clk,
		input reset,
		output [31:0] instruction
		);

	wire [31:0] wire_address_out;
	wire [31:0] wire_updated_address;

	/* Instantiating all modules that are a part of the IF stage */
	pc PC(.address_in(wire_updated_address), .clk(clk), .reset(reset), .address_out(wire_address_out));
	add_4 A4(.address(wire_address_out), .updated_address(wire_updated_address));
	instruction_memory IM(.address(wire_address_out), .instruction(instruction));
endmodule

/*******************************************************************************************************************************************************************/

/* Testbench */

module tb_instruction_fetch;
	reg tb_clk;
	reg tb_reset;
	wire [31:0] tb_instruction;
	
	/* Instantiating the IF module */
	instruction_fetch IF(.clk(tb_clk), .reset(tb_reset), .instruction(tb_instruction));

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
		tb_reset = 0 ; 
		#10 tb_reset = 1 ; 
		#10 tb_reset = 0 ; 
		#10 tb_reset = 0 ; 
		#10 tb_reset = 0 ; 
		#10 tb_reset = 0 ; 
		#10 tb_reset = 1 ; 
		#10 tb_reset = 0 ; 
	end
endmodule

/*******************************************************************************************************************************************************************/

	
