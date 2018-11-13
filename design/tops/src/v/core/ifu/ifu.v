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

	/* status definition */
	// -- IDLE : reset mode, if jump valid, then change to JMP state, else change to NFTH state next cycle of IDLE.
	// -- JMP  : jump mode, to judge and store jump actions.
	// -- NFTH : normal fetch state, asserting the request.
	// -- NHOLD: normal fetch hold state, then according to jmp signal and target valid signal to do the next.
	// -- TODO
	/* TODO */
	/*********************/

	/* interface declaration */
	input i_Clk,i_RstN;

	// jumping inputs
	input i_JmpV; // jump valid signal
	input i_JmpC; // jump command, indicates the type of jump, type of 0 indicates no pc-push jump, else indicates pc-push jump
	input [29:0] i_JmpT; // jump target PC, which is part of address: [31:2]

	// fetch request, these are self-defined request and response interface protocol
	output o_FetchV; // fetch request valid signal
	input  i_TrgtV;  // target valid signal, for each request, only this signal recevied high, then can next request be sended.
	output [31:0] o_FetchT; // fetch request target

	/*************************/

	/* internal reg & wire */
	reg [1:0] r_stat,r_nstat;
	/***********************/


	always @(posedge i_Clk or negedge i_RstN) begin // {
		if (!i_RstN) begin // {
			r_nstat <= IDLE;
		// }
		end else begin // {
			// using FSM
			case (r_stat) // {
				IDLE: begin // {
				end // }
				JMP: begin // {
				end // }
				NFTH: begin // {
				end // }
				NHOLD: begin // {
				end // }
				default: begin // {
					r_nstat <= r_stat;
				end // }
			endcase // }
		end // }
	end // }

	/* this block to change state according to next stat */
	always @(posedge i_Clk or negedge i_RstN) begin // {
		if (!i_RstN) begin // {
			r_stat <= IDLE;
		// }
		end else begin // {
			r_stat <= r_nstat;
		end // }
	end // }

endmodule
