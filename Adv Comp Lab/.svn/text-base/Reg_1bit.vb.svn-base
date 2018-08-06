//Memory cell behavioral model

module Reg_1bit(data, R1, R2, write, out1, out2);

	input 	data;
	input 	R1;
	input 	R2;
	input 	write;
	output 	out1;
	output 	out2;

	reg 	d;

	bufif1(out1, d, R1);
	bufif1(out2, d, R2);
	always@(write)
	begin
		if(write==1) d=data;
	end
endmodule			//Reg_1bit
