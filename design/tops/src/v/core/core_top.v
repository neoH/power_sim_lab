
/*
This is a core act as a CPU liked module, which will fetch and process instructions actively.

-------------------------------------------------------------------------------------------------------
From connection aspect, the core module will provide ahb instruction interfaces for instruction fetch
while use the system interfaces for IO accessing.
Therefore, no interrupt is valid for this core.
-------------------------------------------------------------------------------------------------------
Instructions supported:
-- Algorithm Instr:
	-- addw: 32-bit long signed add
	-- subw: 32-bit long signed sub
	-- mulw: 32-bit long signed multiple
	-- divw: 32-bit long signed divide
-- Logical Instr: to logical operanding two src register, and store the result into the target resiger
	-- land: logical and
	-- lor : logical or
	-- lnot: logical not
-- Compare Instr: the comparison result will be stored into a special register
	-- cmplt: larger than compare
	-- cmpst: smaller than compare
	-- cmpeq: equal than compare
-- Jumping Instr:
	-- call: call jumping
	-- rtn : return jumping
	-- jmp : unconditional jumping
	-- beq: jump when the comparison result is 0.
	-- bne: jump when the comarison result is not 0.
-- Memory Access Instr:
	-- stw: store word long data from r0~r31 to target memory space
	-- ldw: load word long data from memory space to target r0~r31
	-- ldi: immediate load instruction
	-- ldih: immediate load high instruction
-------------------------------------------------------------------------------------------------------
Instructions format:
	-- [31:29]: First Degree OpCode (FDO), width is 3, maximum degree numbers: 8
	Algrithm Instr:
		-- [28:17]   : RSV
		-- [16:15]   : Second decoder
		-- [14:10]   : OPR0, operand 0, indicates the add src 0
		-- [9:5]     : OPR1, operand 1, indicates the add src 1
		-- [4:0]     : RST0, operand 2, indicates the add result
	Logical Instr:
		-- [28:17]   : RSV
		-- [16:15]   : Second decoder
		-- [14:10]   : src operand 0
		-- [9:5]     : src operand 1
		-- [4:0]     : result operand
	Compare Instr:
		-- [28:12]   : RSV
		-- [11:10]   : second decoder
		-- [9:5]     : src operand 0
		-- [4:0]     : src operand 1
	Jumping Instr:
		-- [28:8]    : RSV
		-- [7:5]     : second decoder
		-- [4:0]     : target operand stores the target jumping PC
	Memory Access Instr:
		-- [28:27]   : second decoder
		-- [25:21]   : the register used to store the data that will be stored in ld* or data to write the the
		target memory space in st*.

		immediate instruction:
		-- [15:0]    : the immediate data

		register access instruction:
		-- [4:0]     : the register, used in ldw or stw that stores target memory address.
-------------------------------------------------------------------------------------------------------
Common Register decoding:
	-- used directly in instruction, use 5-bit long binary to indicates the register
-------------------------------------------------------------------------------------------------------
Specific Register:
	-- CSR: Core Status Register, [indicates the core status]
		-- [0]   : compare result value.
-------------------------------------------------------------------------------------------------------
Module Division:
	-- Instruction Fetch Unit (IFU)
	-- Instruction Decode Unit (IDU)
	-- Instruction Execute Unit (IEU)
	-- Instruction Complete Unit (ICU)
-------------------------------------------------------------------------------------------------------
IFU:
	Process the fetch action,
-------------------------------------------------------------------------------------------------------
ahb_if: ahb interface module, which is a common module
-------------------------------------------------------------------------------------------------------
*/

module core_top(
	i_Clk,
	i_RstN,
	// ----- instruction ahbl interface ----- // {
	// outputs
	o_Ihaddr,
	o_Ihwrite,
	o_Ihprot,
	o_Ihsize,
	o_Ihburst,
	o_Ihtrans,
	o_Ihmstlock,
	o_Ihwdata,
	// inputs
	i_Ihrdata,
	i_Ihready,
	i_Ihresp,
	// -------------------------------------- // }

);

	input i_Clk;   // system core clock, which act as the work clock.
	input i_RstN;  // system result, valid in low level, which used to reset all internal register level values.


	// module instances //

	ifu m_ifu(
	);





endmodule
