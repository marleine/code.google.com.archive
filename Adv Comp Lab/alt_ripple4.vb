// 4-bit adder behavioral model

module alt_ripple4 (b, a, cin, sum, cout);

	input	[3:0]	b;
	input	[3:0]	a;
	input		cin;
	output	[3:0]	sum;
	output		cout;

   // Enter verilog here
   assign {cout, sum[3:0]} = {1'b0, a[3:0]} + {1'b0, b[3:0]} + {4'b0, cin};

endmodule		// alt_ripple4
