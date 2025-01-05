`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2019 12:22:32 PM
// Design Name: 
// Module Name: controlUnit
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


module controlUnit(
  input [2:0] opCode,
  output reg registerWriteEnable,
  output [2:0] operationType,
  output [1:0] destinationSource);
  
  reg [5:0] ctrlSignals;
  assign {registerWriteEnable, operationType, destinationSource} = ctrlSignals;

  always @(*)
    case(opCode)        
      3'b000: ctrlSignals = 6'b1_000_00; // No operation
      3'b001: ctrlSignals = 6'b1_000_01; // Load
      3'b010: ctrlSignals = 6'b1_000_10; // Store
      3'b011: ctrlSignals = 6'b1_001_10; // Add
      3'b100: ctrlSignals = 6'b1_010_10; // Subtract
      3'b101: ctrlSignals = 6'b1_011_10; // Multiply
      3'b110: ctrlSignals = 6'b1_100_10; // Divide
      3'b111: ctrlSignals = 6'b0_000_11; // Halt
      default: ctrlSignals = 6'b000000;  // Default safe state
    endcase
endmodule

