/*
	This is a module for instruction fetch. The ifu will fetch one instruction each cycle according
to the next PC value.

	Each cycle, it will fetch one instruction


-----------------------------------------------------------------------------------------------------------

*/



module ifu (
	i_Clk,
	i_RstN,
	i_JmpV,
	i_JmpC,
	i_JmpT,
	o_FetchV,
	o_FetchT,
	i_TrgtV
);


	parameter ST_DEPTH = 16;


	/* interface declaration */
	input i_Clk,i_RstN;

	// jumping inputs
	input i_JmpV; // jump valid signal
	input i_JmpC; // jump command, indicates the type of jump, type of 0 indicates no pc-push jump, else indicates pc-push jump
	input [29:0] i_JmpT; // jump target PC, which is part of address: [31:2]

	// fetch request, these are self-defined request and response interface protocol
	output o_FetchV; // fetch request valid signal
	output [31:0] o_FetchT; // fetch request target
	input i_TrgtV;   // target valid signal, for each request, only this signal recevied high, then can next request be sended.

	/*************************/

	/* internal reg & wire */
	/***********************/


	always @(posedge i_Clk or negedge i_RstN) begin // {
		if (!i_RstN) begin // {
		// }
		end else begin // {
		end // }
	end // }


endmodule
