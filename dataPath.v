`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2019 12:23:10 PM
// Design Name: 
// Module Name: dataPath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dataPath(
    input [7:0] dataIn,       // Input data
    input [2:0] Rx,           // Register X address
    input [2:0] Ry,           // Register Y address
    output [7:0] dataOut,     // Output data
    input [2:0] addsub,       // ALU operation selector
    input [1:0] destSrc,      // Destination source selector
    input regWrite,           // Register write enable
    input clock               // Clock signal
    );
	wire [7:0] dataA,  dataB, dataW, result; 

	assign dataOut = dataW;
	
	regFile RF(Ry, Rx, Rx, regWrite, dataA, dataB, dataW, clock);
	
	ALU   AS(dataB, dataA, addsub, result);
	
	MUX3  mux(dataIn, dataA, result, dataB, destSrc, dataW);


endmodule
