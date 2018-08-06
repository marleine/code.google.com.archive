// FILE: Logic_64_32.vh

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

	Logic_64_32 Logic_64_32();

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

// VERILOG netlist for "Logic_64_32" (generated by MMI_SUE4.4.0)

module xgate (in, in_L, t1, t2);
	inout		t1;
	inout		t2;
	input		in;
	input		in_L;
 
	pmos p(t2,t1,in_L);
	nmos n(t2,t1,in);

endmodule		// xgate

module my_xor (in1, in2, out);
	input		in1;
	input		in2;
	output		out;
 
	wire		net_2;
	wire		net_3;
	wire		net_1;
 
	not #0 inv(net_1, in1);
	not #0 inv_1(out, net_2);
	not #0 inv_2(net_3, in2);
	xgate xgate(.in_L(net_1), .t2(net_2), .in(in1), .t1(in2));
	xgate xgate_1(.in(net_1), .t2(net_2), .t1(net_3), .in_L(in1));

endmodule		// my_xor

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

module MUX_4_1 (S0, S1, a, b, c, d, out);
	input		S0;
	input		S1;
	input		a;
	input		b;
	input		c;
	input		d;
	output		out;
 
	wire		net_2;
	wire		net_3;
	wire		net_1;
 
	MUX_2_1 MUX_2_1(.S0(net_1), .out(net_2), .a(a), .b(b));
	MUX_2_1 MUX_2_2(.out(net_3), .b(d), .S0(S0), .a(c));
	MUX_2_1 MUX_2_3(.a(net_2), .b(net_3), .out(out), .S0(S1));
	not #0 inv(net_1, S0);

endmodule		// MUX_4_1

module Logic (Out, S, a, b);
	input		a;
	input		b;
	input	[1:0]	S;
	output		Out;
 
	wire		net_6;
	wire		net_2;
	wire		net_7;
	wire		net_3;
	wire		net_4;
	wire		net_5;
	wire		net_1;
 
	assign #0 net_5 = !(a && b);
	not #0 inv(net_2, net_5);
	assign net_3 = !(a || b);
	not #0 inv_1(net_6, net_3);
	my_xor my_xor(.out(net_1), .in1(a), .in2(b));
	my_xor my_xor_1(.out(net_7), .in1(a), .in2(b));
	not #0 inv_2(net_4, net_7);
	MUX_4_1 MUX_4_1(.c(net_1), .a(net_2), .d(net_4), .b(net_6), 
		.out(Out), .S1(S[1]), .S0(S[0]));

endmodule		// Logic

module Logic_64_32 (A, B, Out, S);
	input	[31:0]	A;
	input	[31:0]	B;
	input	[1:0]	S;
	output	[31:0]	Out;
 
	Logic Logic(.Out(Out[0]), .a(A[0]), .b(B[0]), .S(S[1:0]));
	Logic Logic_1(.Out(Out[1]), .a(A[1]), .b(B[1]), .S(S[1:0]));
	Logic Logic_2(.Out(Out[2]), .a(A[2]), .b(B[2]), .S(S[1:0]));
	Logic Logic_3(.Out(Out[3]), .a(A[3]), .b(B[3]), .S(S[1:0]));
	Logic Logic_4(.Out(Out[4]), .a(A[4]), .b(B[4]), .S(S[1:0]));
	Logic Logic_5(.Out(Out[5]), .a(A[5]), .b(B[5]), .S(S[1:0]));
	Logic Logic_6(.Out(Out[6]), .a(A[6]), .b(B[6]), .S(S[1:0]));
	Logic Logic_7(.Out(Out[7]), .a(A[7]), .b(B[7]), .S(S[1:0]));
	Logic Logic_8(.Out(Out[8]), .a(A[8]), .b(B[8]), .S(S[1:0]));
	Logic Logic_9(.Out(Out[9]), .a(A[9]), .b(B[9]), .S(S[1:0]));
	Logic Logic_10(.Out(Out[10]), .a(A[10]), .b(B[10]), .S(S[1:0]));
	Logic Logic_11(.Out(Out[11]), .a(A[11]), .b(B[11]), .S(S[1:0]));
	Logic Logic_12(.Out(Out[12]), .a(A[12]), .b(B[12]), .S(S[1:0]));
	Logic Logic_13(.Out(Out[13]), .a(A[13]), .b(B[13]), .S(S[1:0]));
	Logic Logic_14(.Out(Out[14]), .a(A[14]), .b(B[14]), .S(S[1:0]));
	Logic Logic_15(.Out(Out[15]), .a(A[15]), .b(B[15]), .S(S[1:0]));
	Logic Logic_16(.Out(Out[16]), .a(A[16]), .b(B[16]), .S(S[1:0]));
	Logic Logic_17(.Out(Out[17]), .a(A[17]), .b(B[17]), .S(S[1:0]));
	Logic Logic_18(.Out(Out[18]), .a(A[18]), .b(B[18]), .S(S[1:0]));
	Logic Logic_19(.Out(Out[19]), .a(A[19]), .b(B[19]), .S(S[1:0]));
	Logic Logic_20(.Out(Out[20]), .a(A[20]), .b(B[20]), .S(S[1:0]));
	Logic Logic_21(.Out(Out[21]), .a(A[21]), .b(B[21]), .S(S[1:0]));
	Logic Logic_22(.Out(Out[22]), .a(A[22]), .b(B[22]), .S(S[1:0]));
	Logic Logic_23(.Out(Out[23]), .a(A[23]), .b(B[23]), .S(S[1:0]));
	Logic Logic_24(.Out(Out[24]), .a(A[24]), .b(B[24]), .S(S[1:0]));
	Logic Logic_25(.Out(Out[25]), .a(A[25]), .b(B[25]), .S(S[1:0]));
	Logic Logic_26(.Out(Out[26]), .a(A[26]), .b(B[26]), .S(S[1:0]));
	Logic Logic_27(.Out(Out[27]), .a(A[27]), .b(B[27]), .S(S[1:0]));
	Logic Logic_28(.Out(Out[28]), .a(A[28]), .b(B[28]), .S(S[1:0]));
	Logic Logic_29(.Out(Out[29]), .a(A[29]), .b(B[29]), .S(S[1:0]));
	Logic Logic_30(.Out(Out[30]), .a(A[30]), .b(B[30]), .S(S[1:0]));
	Logic Logic_31(.Out(Out[31]), .a(A[31]), .b(B[31]), .S(S[1:0]));

endmodule		// Logic_64_32

