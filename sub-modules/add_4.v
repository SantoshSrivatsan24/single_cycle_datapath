/* Author: Santosh Srivatsan	2017A8PS1924G */
/* SUB-MODULE : ADD 0x04 TO PC */

module add_4(
		input [31:0] address,
		output [31:0] updated_address
		);
	
	assign updated_address = address + 32'h04;
endmodule

/*******************************************************************************************************************************************************************/

/* Testbench */

module tb_add_4;
	reg [31:0] tb_address;
	wire [31:0] tb_updated_address;
	
	/* Instantiating the update_pc module */
	add_4 A4(.address(tb_address), .updated_address(tb_updated_address));

	initial #100 $finish;
	
	initial
	begin
		tb_address = 32'h04;
		#10 tb_address = 32'h08;
		#10 tb_address = 32'h0c;
		#10 tb_address = 32'h10;
		#10 tb_address = 32'h14;
		#10 tb_address = 32'h18;
	end
endmodule

/*******************************************************************************************************************************************************************/
		


