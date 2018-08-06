// clock generator module for the SUE tutorial

module clock (clock_out);

   output    clock_out;
   reg	     clock_out;

   // delay 20 units between clock phases
   parameter cycletime = 20;

   initial begin
      // start the clock low
      clock_out = 1'b0;
   end

   always begin
      #cycletime begin
	 // flip the clock
	 clock_out = !clock_out;
      end
   end

endmodule		// clock
