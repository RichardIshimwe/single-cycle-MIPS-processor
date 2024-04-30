module mux4to1_32bit (
    input [31:0] A,
    input [31:0] B,
    input [31:0] C,
    input [31:0] D,
    input [1:0] Select,
    output [31:0] Y
);

assign Y = (Select == 2'b00) ? A :
           (Select == 2'b01) ? B :
           (Select == 2'b10) ? C :
           (Select == 2'b11) ? D :
           32'b0;

endmodule

`timescale 1ns/1ps

module mux4to1_32bit_tb;

// Parameters
parameter WIDTH = 32;
parameter ITERATIONS = 10;

// Inputs
reg [WIDTH-1:0] A;
reg [WIDTH-1:0] B;
reg [WIDTH-1:0] C;
reg [WIDTH-1:0] D;
reg [1:0] Select;

// Output
wire [WIDTH-1:0] Y;

// Instantiate the module
mux4to1_32bit dut (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .Select(Select),
    .Y(Y)
);

// Clock
reg clk = 0;

// Toggle clock
always #5 clk = ~clk;

// Testbench
initial begin
    $monitor("Time=%0t, A=%h, B=%h, C=%h, D=%h, Select=%b, Y=%h", $time, A, B, C, D, Select, Y);
    
    // Randomize inputs and test
    repeat (ITERATIONS) begin
        A = $random;
        B = $random;
        C = $random;
        D = $random;
        Select = $urandom_range(0, 4); // Randomize select between 0 and 3
        
        #10; // Wait a bit
        
        // Display result
        $display("Result: Y=%h", Y);
    end
    
    // End simulation
    $finish;
end

endmodule