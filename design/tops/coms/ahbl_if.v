/*
It is a module that to process the AHB-Lite protocol.
For now, the only module needed the interface is IFU, so we will
declare this module as the IFU needs.
*/
module ahbl_if (
	/* input clock and reset */
	i_HClk,
	i_RstN,
	/* output the ahbl request */
	o_HAddr,
	o_HBurst,
	o_HTrans,
	o_HSize,
	o_HWrite,
	o_HWdata,
	/* input the ahbl response */
	i_HResp,
	i_HReady,
	i_HRdata,
	/* input the request from fetch */
	i_Req,     //  the request information, which used for different usage
	i_Valid    // the valid signal which indicates the PC current is valid
);

	/* declaration for the i_Req information as two following uage: */
	// -- for IFU module:


	// -- for Data Access module:

	/****************************************************************/

	parameter RW  = 32;     // the hrdata width
	parameter AW  = 32;     // the address width
	parameter PCW = AW - 2; // the PC width
	parameter WW  = 32;     // the write data width

	input i_HClk, i_RstN; // clock and reset region
	/* ahbl response region */
	input [1:0] i_HResp;
	input i_HReady;
	input [RW-1:0] i_HRdata;
	/************************/



endmodule
