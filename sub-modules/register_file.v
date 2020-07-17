/* Author: Santosh Srivatsan	2017A8PS1924G */
/* SUB-MODULE : 32 x 32 REGISTER FILE */

module register_file(
		input [4:0] rs1,
		input [4:0] rs2,
		input [4:0] rd,
		input [31:0] write_data,
		output [31:0] data1,
		output [31:0] data2
		);

	/* Reserving memory for 32 32-bit registers */
	reg [31:0] register_array [31:0];

	/* Assigning data1 and data2 to the values in the registers given by the addresses rs1 and rs2 respectively */
	assign data1 = register_array[rs1];
	assign data2 = register_array[rs2];

	/* We want to initialise the values of all registers to 0.
	   This is in an initial block because we don't want to initialise registers at every clock cycle */
	initial $readmemh("register_file.mem", register_array);
		
	always @(*) register_array[rd] = write_data;	
endmodule

/*******************************************************************************************************************************************************************/

/* Testbench */

module tb_register_file;
		reg [4:0] tb_rs1;
		reg [4:0] tb_rs2;
		reg [4:0] tb_rd;
		reg [31:0] tb_write_data;
		wire [31:0] tb_data1;
		wire [31:0] tb_data2;

	/* Instantiating the register file module */
	register_file RF(.rs1(tb_rs1), .rs2(tb_rs2), .rd(tb_rd), .write_data(tb_write_data), .data1(tb_data1), .data2(tb_data2));

	initial #100 $finish;

	/* Reading from register file */
	initial
	begin
		#0  tb_rs1 = 0 ; tb_rs2 = 1; tb_rd = 2 ; tb_write_data = 10;
		#10 tb_rs1 = 3 ; tb_rs2 = 4; tb_rd = 5 ; tb_write_data = 20;
		#10 tb_rs1 = 6 ; tb_rs2 = 7; tb_rd = 8 ; tb_write_data = 30;
		#10 tb_rs1 = 9 ; tb_rs2 = 10; tb_rd = 11; tb_write_data = 40;
	end
endmodule

/*******************************************************************************************************************************************************************/
		


	
