`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2019 12:26:53 PM
// Design Name: 
// Module Name: testProc
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


module testProc;

	// Inputs
	reg [7:0] dataIn;
	reg [8:0] func;
	reg clock;

	// Outputs
	wire [7:0] dataOut;

	// Instantiate the Unit Under Test (UUT)
	simple8BitProcessor uut (
		.dataIn(dataIn), 
		.dataOut(dataOut), 
		.func(func), 
		.clock(clock)
	);
	
	always
		#5 clock = ~clock;

	initial begin
		// Initialize Inputs
		dataIn = 0;
		func = 0;
		clock = 0;

		//$monitor("%t For data in = %d ---->  dataout = %d", $time, dataIn, dataOut);
        
	     @(negedge clock);
       
        dataIn = 10;
        func = 9'b000_001_000; // load R1, 10

        @(negedge clock);
      
        dataIn = 5;
        func = 9'b000_000_000;    // load R0, 5
		  
		  @(negedge clock);
        func = 9'b110_000_001;    // xor r0,r1
		  
		  @(negedge clock);
       
        dataIn = 1;
        func = 9'b000_010_000; // load R2, 1

        @(negedge clock);
      
        dataIn = 2;
        func = 9'b000_011_000;    // load R3, 2
		  
		  @(negedge clock);
        func = 9'b010_010_011;    // add r2,r3
		  
		  @(negedge clock);
       
        dataIn = 8;
        func = 9'b000_100_000; // load R4, 8

        @(negedge clock);
      
        dataIn = 6;
        func = 9'b000_101_000;    // load R5, 6
		  
		  @(negedge clock);
        func = 9'b101_100_101;    // or r4,r5		  
		
		  @(negedge clock);
       
        dataIn = 7;
        func = 9'b000_110_000; // load R6, 7

		  
		  @(negedge clock);
        func = 9'b001_111_110;    // move r7,r6	  
		  
		  
		  @(negedge clock);
   
        func = 9'b111_111_000; // store R7
		  
		  
		  
		  @(negedge clock);
   
        func = 9'b100_000_010; // and R0, R2
		  
	     
		  
		  @(negedge clock);
   
        func = 9'b011_100_111; // SUB R4, R7
		  
		  
		 		  
		  
		  
		  
		  
		  
		  
		  
		  
		  #20
        $stop;



	end
      
endmodule
