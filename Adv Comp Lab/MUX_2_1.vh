// FILE: MUX_2_1.vh

// ************************************************************************

// default verilog header file

// units of time and time resolution for this run
`timescale 1ps / 1ps

// this must be the very first module for interactive probing to work
module test;

// reg		a;
// wire		b;

// needed for interactive verilog probing.
   integer         tmp_channel;

// instantiate main verilog module
// NOTE: the name of the module must be the same as its type

	MUX_2_1 MUX_2_1();

    initial
      begin
//    	$dumpfile();
//	$dumpvars;

//	a = 0;

// #1000 	a = 1; 

// #2000 	a = 0; 

//	$finish;
      end

endmodule

// include files
// `include "foo.v"

// ************************************************************************

// VERILOG netlist for "MUX_2_1" (generated by MMI_SUE4.4.0)

module MUX_2_1 (S0, a, b, out);
	input		S0;
	input		a;
	input		b;
	output		out;
 
	wire		net_2;
	wire		net_3;
	wire		net_1;
 
	assign #0 net_1 = !(a && net_2);
	assign #0 net_3 = !(b && S0);
	assign #0 out = !(net_1 && net_3);
	not #0 inv(net_2, S0);

endmodule		// MUX_2_1

