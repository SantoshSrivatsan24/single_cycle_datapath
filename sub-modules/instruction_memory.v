/* Author: Santosh Srivatsan	2017A8PS1924G */
/* SUB-MODULE : 50 x 8 INSTRUCTION MEMORY */

module instruction_memory(
		input [31:0] address,
		output [31:0] instruction
		);

	/* Reserving memory for 20 instructions */
	reg [7:0] memory_array [59:0]; 	

	/* Assigning the instruction to the corresponing memory location */
	assign instruction = {memory_array[address + 3], memory_array[address + 2], memory_array[address + 1], memory_array[address]};
	
	/* Read instructions from .mem file whenever the address changes */
	always @(address) $readmemh("instruction_memory.mem", memory_array);
endmodule

/*******************************************************************************************************************************************************************/

/* Testbench */

module tb_instruction_memory;
		reg [31:0] tb_address;
		wire [31:0] tb_instruction;

		/* Instantiating the instruction memory module */
		instruction_memory IM(.address(tb_address), .instruction(tb_instruction));

		initial #100 $finish;

		/* Reading from memory */
		initial
		begin
			#0  tb_address = 0;
			#10 tb_address = 4;
			#10 tb_address = 8;
			#10 tb_address = 12;
			#10 tb_address = 16;
			#10 tb_address = 20;
			#10 tb_address = 24;
			#10 tb_address = 28;
			#10 tb_address = 32;

		end
endmodule

/*******************************************************************************************************************************************************************/
			


		

		

	
	