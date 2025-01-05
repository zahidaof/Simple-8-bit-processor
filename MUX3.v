`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2019 12:25:52 PM
// Design Name: 
// Module Name: MUX3
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


module MUX3(
    input [7:0] in1,      // First input
    input [7:0] in2,      // Second input
    input [7:0] in3,      // Third input
    input [7:0] inpu4,    // Fourth input
    input [1:0] ctr,      // Control signal to select the input
    output reg [7:0] out  // Output
    );

    always @(*)
        case(ctr)
            2'b00: out = in1;    // Select first input
            2'b01: out = in2;    // Select second input
            2'b10: out = in3;    // Select third input
            2'b11: out = inpu4;  // Select fourth input
        endcase

endmodule
