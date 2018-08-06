// FILE: ALU.vh

`include "ALU.vi"

// VERILOG netlist for "ALU" (generated by MMI_SUE4.4.0)

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

module Comp (B, Out, S);
	input	[31:0]	B;
	input	[1:1]	S;
	output	[31:0]	Out;
 
	my_xor my_xor(.out(Out[31]), .in1(B[31]), .in2(S[1]));
	my_xor my_xor_1(.out(Out[30]), .in1(B[30]), .in2(S[1]));
	my_xor my_xor_2(.out(Out[29]), .in1(B[29]), .in2(S[1]));
	my_xor my_xor_3(.out(Out[28]), .in1(B[28]), .in2(S[1]));
	my_xor my_xor_4(.out(Out[27]), .in1(B[27]), .in2(S[1]));
	my_xor my_xor_5(.out(Out[26]), .in1(B[26]), .in2(S[1]));
	my_xor my_xor_6(.out(Out[25]), .in1(B[25]), .in2(S[1]));
	my_xor my_xor_7(.out(Out[24]), .in1(B[24]), .in2(S[1]));
	my_xor my_xor_8(.out(Out[23]), .in1(B[23]), .in2(S[1]));
	my_xor my_xor_9(.out(Out[22]), .in1(B[22]), .in2(S[1]));
	my_xor my_xor_10(.out(Out[21]), .in1(B[21]), .in2(S[1]));
	my_xor my_xor_11(.out(Out[20]), .in1(B[20]), .in2(S[1]));
	my_xor my_xor_12(.out(Out[19]), .in1(B[19]), .in2(S[1]));
	my_xor my_xor_13(.out(Out[18]), .in1(B[18]), .in2(S[1]));
	my_xor my_xor_14(.out(Out[17]), .in1(B[17]), .in2(S[1]));
	my_xor my_xor_15(.out(Out[16]), .in1(B[16]), .in2(S[1]));
	my_xor my_xor_16(.out(Out[15]), .in1(B[15]), .in2(S[1]));
	my_xor my_xor_17(.out(Out[14]), .in1(B[14]), .in2(S[1]));
	my_xor my_xor_18(.out(Out[13]), .in1(B[13]), .in2(S[1]));
	my_xor my_xor_19(.out(Out[12]), .in1(B[12]), .in2(S[1]));
	my_xor my_xor_20(.out(Out[11]), .in1(B[11]), .in2(S[1]));
	my_xor my_xor_21(.out(Out[10]), .in1(B[10]), .in2(S[1]));
	my_xor my_xor_22(.out(Out[9]), .in1(B[9]), .in2(S[1]));
	my_xor my_xor_23(.out(Out[8]), .in1(B[8]), .in2(S[1]));
	my_xor my_xor_24(.out(Out[7]), .in1(B[7]), .in2(S[1]));
	my_xor my_xor_25(.out(Out[6]), .in1(B[6]), .in2(S[1]));
	my_xor my_xor_26(.out(Out[5]), .in1(B[5]), .in2(S[1]));
	my_xor my_xor_27(.out(Out[4]), .in1(B[4]), .in2(S[1]));
	my_xor my_xor_28(.out(Out[3]), .in1(B[3]), .in2(S[1]));
	my_xor my_xor_29(.out(Out[2]), .in1(B[2]), .in2(S[1]));
	my_xor my_xor_30(.out(Out[1]), .in1(B[1]), .in2(S[1]));
	my_xor my_xor_31(.out(Out[0]), .in1(B[0]), .in2(S[1]));

endmodule		// Comp

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

module MUX_64_32 (A, B, Out, S);
	input	[31:0]	A;
	input	[31:0]	B;
	input	[2:2]	S;
	output	[31:0]	Out;
 
	MUX_2_1 MUX_2_1(.out(Out[0]), .a(A[0]), .b(B[0]), .S0(S[2]));
	MUX_2_1 MUX_2_2(.out(Out[1]), .a(A[1]), .b(B[1]), .S0(S[2]));
	MUX_2_1 MUX_2_3(.out(Out[2]), .a(A[2]), .b(B[2]), .S0(S[2]));
	MUX_2_1 MUX_2_4(.out(Out[3]), .a(A[3]), .b(B[3]), .S0(S[2]));
	MUX_2_1 MUX_2_5(.out(Out[4]), .a(A[4]), .b(B[4]), .S0(S[2]));
	MUX_2_1 MUX_2_6(.out(Out[5]), .a(A[5]), .b(B[5]), .S0(S[2]));
	MUX_2_1 MUX_2_7(.out(Out[6]), .a(A[6]), .b(B[6]), .S0(S[2]));
	MUX_2_1 MUX_2_8(.out(Out[7]), .a(A[7]), .b(B[7]), .S0(S[2]));
	MUX_2_1 MUX_2_9(.out(Out[8]), .a(A[8]), .b(B[8]), .S0(S[2]));
	MUX_2_1 MUX_2_10(.out(Out[9]), .a(A[9]), .b(B[9]), .S0(S[2]));
	MUX_2_1 MUX_2_11(.out(Out[10]), .a(A[10]), .b(B[10]), .S0(S[2]));
	MUX_2_1 MUX_2_12(.out(Out[11]), .a(A[11]), .b(B[11]), .S0(S[2]));
	MUX_2_1 MUX_2_13(.out(Out[12]), .a(A[12]), .b(B[12]), .S0(S[2]));
	MUX_2_1 MUX_2_14(.out(Out[13]), .a(A[13]), .b(B[13]), .S0(S[2]));
	MUX_2_1 MUX_2_15(.out(Out[14]), .a(A[14]), .b(B[14]), .S0(S[2]));
	MUX_2_1 MUX_2_16(.out(Out[15]), .a(A[15]), .b(B[15]), .S0(S[2]));
	MUX_2_1 MUX_2_17(.out(Out[16]), .a(A[16]), .b(B[16]), .S0(S[2]));
	MUX_2_1 MUX_2_18(.out(Out[17]), .a(A[17]), .b(B[17]), .S0(S[2]));
	MUX_2_1 MUX_2_19(.out(Out[18]), .a(A[18]), .b(B[18]), .S0(S[2]));
	MUX_2_1 MUX_2_20(.out(Out[19]), .a(A[19]), .b(B[19]), .S0(S[2]));
	MUX_2_1 MUX_2_21(.out(Out[20]), .a(A[20]), .b(B[20]), .S0(S[2]));
	MUX_2_1 MUX_2_22(.out(Out[21]), .a(A[21]), .b(B[21]), .S0(S[2]));
	MUX_2_1 MUX_2_23(.out(Out[22]), .a(A[22]), .b(B[22]), .S0(S[2]));
	MUX_2_1 MUX_2_24(.out(Out[23]), .a(A[23]), .b(B[23]), .S0(S[2]));
	MUX_2_1 MUX_2_25(.out(Out[24]), .a(A[24]), .b(B[24]), .S0(S[2]));
	MUX_2_1 MUX_2_26(.out(Out[25]), .a(A[25]), .b(B[25]), .S0(S[2]));
	MUX_2_1 MUX_2_27(.out(Out[26]), .a(A[26]), .b(B[26]), .S0(S[2]));
	MUX_2_1 MUX_2_28(.out(Out[27]), .a(A[27]), .b(B[27]), .S0(S[2]));
	MUX_2_1 MUX_2_29(.out(Out[28]), .a(A[28]), .b(B[28]), .S0(S[2]));
	MUX_2_1 MUX_2_30(.out(Out[29]), .a(A[29]), .b(B[29]), .S0(S[2]));
	MUX_2_1 MUX_2_31(.out(Out[30]), .a(A[30]), .b(B[30]), .S0(S[2]));
	MUX_2_1 MUX_2_32(.out(Out[31]), .a(A[31]), .b(B[31]), .S0(S[2]));

endmodule		// MUX_64_32

module Adder_HA (A, B, Cout, S);
	input		A;
	input		B;
	output		Cout;
	output		S;
 
	wire		net_1;
 
	my_xor my_xor(.in1(A), .in2(B), .out(S));
	assign #0 net_1 = !(A && B);
	not #0 inv(Cout, net_1);

endmodule		// Adder_HA

module Adder_FA (A, B, Cin, Cout, S);
	input		A;
	input		B;
	input		Cin;
	output		Cout;
	output		S;
 
	wire		net_2;
	wire		net_3;
	wire		net_4;
	wire		net_1;
 
	Adder_HA Adder_HA(.S(net_1), .Cout(net_2), .A(A), .B(B));
	Adder_HA Adder_HA_1(.A(net_1), .Cout(net_3), .B(Cin), .S(S));
	assign net_4 = !(net_3 || net_2);
	not #0 inv(Cout, net_4);

endmodule		// Adder_FA

module Adder_4bits (A, B, Cin, Cout, S);
	input		Cin;
	input	[3:0]	A;
	input	[3:0]	B;
	output		Cout;
	output	[3:0]	S;
 
	wire		net_2;
	wire		net_3;
	wire		net_1;
 
	Adder_FA Adder_FA(.Cout(net_2), .A(A[0]), .Cin(Cin), .B(B[0]), 
		.S(S[0]));
	Adder_FA Adder_FA_1(.Cin(net_2), .Cout(net_3), .A(A[1]), .B(B[1]), 
		.S(S[1]));
	Adder_FA Adder_FA_2(.Cout(net_1), .Cin(net_3), .A(A[2]), .B(B[2]), 
		.S(S[2]));
	Adder_FA Adder_FA_3(.Cin(net_1), .A(A[3]), .B(B[3]), .Cout(Cout), 
		.S(S[3]));

endmodule		// Adder_4bits

module Adder_8bits (A, B, Cin, Cout, S);
	input		Cin;
	input	[7:0]	A;
	input	[7:0]	B;
	output		Cout;
	output	[7:0]	S;
 
	wire		net_1;
 
	Adder_4bits Adder_4bits(.Cout(net_1), .A(A[3:0]), .B(B[3:0]), 
		.Cin(Cin), .S(S[3:0]));
	Adder_4bits Adder_4bits_1(.Cin(net_1), .A(A[7:4]), .B(B[7:4]), 
		.S(S[7:4]), .Cout(Cout));

endmodule		// Adder_8bits

module Adder_32bits (A, B, Cin, Cout, S);
	input		Cin;
	input	[31:0]	A;
	input	[31:0]	B;
	output		Cout;
	output	[31:0]	S;
 
	wire		net_2;
	wire		net_3;
	wire		net_1;
 
	Adder_8bits Adder_8bits(.Cout(net_3), .A(A[7:0]), .Cin(Cin), 
		.B(B[7:0]), .S(S[7:0]));
	Adder_8bits Adder_8bits_1(.Cout(net_1), .Cin(net_3), .A(A[15:8]), 
		.B(B[15:8]), .S(S[15:8]));
	Adder_8bits Adder_8bits_2(.Cin(net_1), .Cout(net_2), .A(A[23:16]), 
		.B(B[23:16]), .S(S[23:16]));
	Adder_8bits Adder_8bits_3(.Cin(net_2), .A(A[31:24]), .B(B[31:24]), 
		.Cout(Cout), .S(S[31:24]));

endmodule		// Adder_32bits

module MUX_4_1 (S, a, b, c, d, out);
	input		a;
	input		b;
	input		c;
	input		d;
	input	[1:0]	S;
	output		out;
 
	wire		net_2;
	wire		net_1;
 
	MUX_2_1 MUX_2_1(.out(net_1), .a(a), .b(b), .S0(S[0]));
	MUX_2_1 MUX_2_2(.out(net_2), .b(d), .S0(S[0]), .a(c));
	MUX_2_1 MUX_2_3(.a(net_1), .b(net_2), .out(out), .S0(S[1]));

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
 
	not #0 inv(net_5, net_7);
	not #0 inv_1(net_1, net_4);
	my_xor my_xor(.out(net_2), .in1(a), .in2(b));
	my_xor my_xor_1(.out(net_6), .in1(a), .in2(b));
	not #0 inv_2(net_3, net_6);
	assign #0 net_7 = !(a && b);
	assign net_4 = !(a || b);
	MUX_4_1 MUX_4_1(.b(net_1), .c(net_2), .d(net_3), .a(net_5), 
		.out(Out), .S(S[1:0]));

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

module ALU (ALU_Result, a, b, cout, s);
	input	[31:0]	a;
	input	[31:0]	b;
	input	[2:0]	s;
	output		cout;
	output	[31:0]	ALU_Result;
 
	wire	[31:0]	net_2;
	wire	[31:0]	net_3;
	wire	[31:0]	net_1;
 
	Comp Comp(.Out(net_3[31:0]), .B(b[31:0]), .S(s[1]));
	MUX_64_32 MUX_64_32(.B(net_1[31:0]), .A(net_2[31:0]), 
		.Out(ALU_Result[31:0]), .S(s[2]));
	Adder_32bits Adder_32bits(.S(net_2[31:0]), .B(net_3[31:0]), 
		.A(a[31:0]), .Cout(cout), .Cin(s[0]));
	Logic_64_32 Logic_64_32(.Out(net_1[31:0]), .A(a[31:0]), .B(b[31:0]), 
		.S(s[1:0]));

endmodule		// ALU
