`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2019 12:25:13 PM
// Design Name: 
// Module Name: ALU
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

module ALU(
    input [7:0] parmA,
    input [7:0] parmB,
    input [2:0] AluSrc,
    output reg [7:0] result
    );

    always @(*) 
        case(AluSrc)
            3'b000: result = parmA + parmB; // Addition
            3'b001: result = parmA - parmB; // Subtraction
            3'b010: result = parmA & parmB; // Bitwise AND
            3'b011: result = parmA | parmB; // Bitwise OR
            3'b100: result = parmA ^ parmB; // Bitwise XOR
            default: result = 8'b00000000;        // Default case
        endcase
endmodule
