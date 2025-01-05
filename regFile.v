`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2019 12:23:49 PM
// Design Name: 
// Module Name: regFile
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


module regFile #(parameter AddressSize = 3, WordSize = 8 )(  //4 X 8 register file
	 // Addresses
    input [AddressSize-1:0] ra,  // Address of read location 1
    input [AddressSize-1:0] rb,  // Address of read location 2
    input [AddressSize-1:0] rw,  // Address of write location
	 // Control signal 
    input RegWr, 				// Register write enable
	 // Data
    output [WordSize-1:0] dataA,
    output [WordSize-1:0] dataB,
    input  [WordSize-1:0] dataW,
	 
    input clk
    );
  
  reg [WordSize-1:0] rf[0:(1<<AddressSize)-1];  // 2^AddressSize X WordSize 

	initial begin
		rf[0] = 8'h00;
		rf[1] = 8'h00;
		rf[2] = 8'h00;
		rf[3] = 8'h00;
		rf[4] = 8'h00;
		rf[5] = 8'h00;
		rf[6] = 8'h00;
		rf[7] = 8'h00;
	end
		

  // three ported register file
  // read two ports combinationally
  // write third port on rising edge of clock

  always @(posedge clk)
     if (RegWr) rf[rw] <= dataW;	

  assign dataA = rf[ra];  // Asynchronous Reads
  assign dataB = rf[rb];

endmodule