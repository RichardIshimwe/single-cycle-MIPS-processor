`timescale 1ns / 1ps

module FullAdder_TB;

   // Parameters
   parameter int NUM_TESTS = 8;

   // Inputs
   logic [NUM_TESTS-1:0] A, B, Cin;

   // Outputs
   logic [NUM_TESTS-1:0] Sum, Cout;

   // Instantiate Full Adder
   FullAdder dut (
      .A(A),
      .B(B),
      .Cin(Cin),
      .Sum(Sum),
      .Cout(Cout)
   );

   // Test Stimulus
   initial begin
      $display("Test\tA\tB\tCin\tSum\tCout");
      for (int i = 0; i < NUM_TESTS; i++) begin
         A = $random;
         B = $random;
         Cin = $random;

         // Display test inputs
         $display("%0d\t%b\t%b\t%b\t", i, A, B, Cin);

         // Evaluate outputs
         #1;

         // Display test results
         $display("\t%b\t%b", Sum, Cout);
      end
      $stop;
   end

endmodule