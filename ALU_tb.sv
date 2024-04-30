
// ALU_TB.sv

module ALU_TB;

    // Parameters for the module instantiation
    parameter DATA_WIDTH = 32;

    // Signals for connecting to the ALU module
    logic [DATA_WIDTH-1:0] operandA, operandB;
    logic [2:0] aluOp;
    logic [DATA_WIDTH-1:0] result;
    logic zeroFlag, overflowFlag;

    // Instantiate the ALU module
    ALU #(DATA_WIDTH) alu (
        .operandA(operandA),
        .operandB(operandB),
        .aluOp(aluOp),
        .result(result),
        .zeroFlag(zeroFlag),
        .overflowFlag(overflowFlag)
    );

    // Stimulus generation
    initial begin
        // Test scenario: Addition
        operandA = 32'hAABBCCDD;
        operandB = 32'h00112233;
        aluOp = 3'b000; // Addition
        #10 $display("Result: %h, Zero Flag: %b, Overflow Flag: %b", result, zeroFlag, overflowFlag);

        // Test scenario: Subtraction
        operandA = 32'hAABBCCDD;
        operandB = 32'h00112233;
        aluOp = 3'b001; // Subtraction
        #10 $display("Result: %h, Zero Flag: %b, Overflow Flag: %b", result, zeroFlag, overflowFlag);

        // Add more test scenarios as needed

        // End simulation after some time
        #100 $finish;
    end

endmodule