/*
Each cycle, the value on o_PopDat of this stack is the valid value of the last entered item,
only when i_Pop is valid, then the o_PopDat will change to the next valid item.
*/
module stack(
	i_Clk,
	i_RstN,
	i_Push,
	i_Pop,
	i_PushDat,
	o_PopDat,
	o_Empty,
	o_Full
);

	parameter WIDTH    = 32; // width of each stack item
	parameter ST_DEPTH = 16; // depth of the stack
	parameter PT_WIDTH = 4;

	input i_Clk;
	input i_RstN;

	// valid signals
	input i_Push;
	input i_Pop;

	// item signals
	input  [WIDTH - 1 : 0] i_PushDat;
	output [WIDTH - 1 : 0] o_PopDat;
	output o_Empty;
	output o_Full;


	/* internal regs & wires */
	reg [WIDTH - 1 : 0] r_stack [ST_DEPTH - 1 : 0];
	reg [PT_WIDTH - 1 : 0] r_Ptr;
	// reg [WIDTH - 1 : 0] r_Dat;
	/*************************/


	/* combination logic */
	assign o_PopDat = r_stack[r_Ptr];
	assign o_Empty  = (r_Ptr == {PT_WIDTH{1'b0}}) ? 1'b1 : 1'b0;
	assign o_Full   = (r_Ptr == {PT_WIDTH{1'b1}}) ? 1'b1 : 1'b0;
	/*********************/

	/* main block and item process unit */
	// three situations will be occurred:
	// -- 1. Pop only
	// -- 2. Push only
	// -- 3. Pop and Push both
	always @(posedge i_Clk or negedge i_RstN) begin // {
		if (!i_RstN) begin // {
			r_Ptr <= {PT_WIDTH{1'b0}};
			r_Dat <= {WIDTH{1'b0}};
		// }
		end else begin // {
			// use FSM to do the following actions
			case ({i_Push,i_Pop}) // {
				2'b01: begin // {
					// pop valid
					r_Ptr <= r_Ptr - 1'b1;
				end // }
				2'b10: begin // {
					// push valid
					if (r_Ptr != {PT_WIDTH{1'b1}}) begin // {
						// only when stack not full, can this be written
						r_Ptr <= r_Ptr + 1'b1;
						r_stack[r_Ptr] = i_PushDat;
					end // }
				end // }
				2'b11: begin // {
					// push and pop both valid
					// if this occurred, pop first and then do push
					// ptr will not change, override the stack of current ptr instead.
					r_stack[r_Ptr] = i_PushDat;
				end // }
				default: begin // {
					// do nothing, only to keeping value
					r_Ptr <= r_Ptr;
					r_Dat <= r_Dat;
				end // }
			endcase // }
		end // }
	end // }

endmodule
