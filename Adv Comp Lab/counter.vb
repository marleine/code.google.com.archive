// Simple counter to drive the rippl4 adder example in the
// SUE tutorial

module counter (out);

   output [7:0]	out;
   reg [7:0]	out;

   parameter	cycletime = 10;

   initial begin
      out = 1'b0;
   end

   always begin
      #cycletime begin
	 if (out == 255) begin
	    // end simulation after exhausting all possibilities
	    $finish;
	 end

	 // increment out
	 out = out + 1;
      end
   end

endmodule		// counter


