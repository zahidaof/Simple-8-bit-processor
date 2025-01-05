`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2019 12:21:40 PM
// Design Name: 
// Module Name: simple8BitProc
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


module simple8BitProcessor(
    input  [7:0] dataIn,
    output [7:0] dataOut,
	 input  [8:0] func,
	 input  clock
    );
	 wire [2:0] opCode = func[8:6];
	 wire [2:0] Rx = func[5:3];
	 wire [2:0] Ry = func[2:0];
	 wire [2:0]addsub;
	 wire [1:0] destSrc;
	 wire regWrite;
	 
	 
	 controlUnit CU(opCode, regWrite, addsub, destSrc);
	 dataPath    DP(dataIn, Rx, Ry, dataOut, addsub, destSrc, regWrite, clock);

endmodule
