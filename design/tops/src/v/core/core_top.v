
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
-- Logical Instr:
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
-------------------------------------------------------------------------------------------------------
*/

module core_top(
	i_Clk,
	i_RstN,
	// ----- instruction ahbl interface ----- // {
	o_Ihaddr,
	o_Ihwrite,
	o_Ihprot,
	o_Ihsize,
	o_Ihburst,
	o_Ihtrans,
	o_Ihmstlock,
	o_Ihwdata,
	i_Ihrdata,
	i_Ihready,
	i_Ihresp,
	// -------------------------------------- // }

);

	input i_Clk;   // system core clock, which act as the work clock.
	input i_RstN;  // system result, valid in low level, which used to reset all internal register level values.


endmodule
