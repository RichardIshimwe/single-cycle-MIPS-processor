
// ALU.sv

module ALU #(
    parameter DATA_WIDTH = 32
)(
    input logic [DATA_WIDTH-1:0] operandA,
    input logic [DATA_WIDTH-1:0] operandB,
    input logic [2:0] aluOp,
    output logic [DATA_WIDTH-1:0] result,
    output logic zeroFlag,
    output logic overflowFlag
);

    always_comb begin
        // Initialize flags
        zeroFlag = 0;
        overflowFlag = 0;

        // ALU operations based on aluOp
        case (aluOp)
            3'b000: result = operandA + operandB; // Addition
            3'b001: result = operandA - operandB; // Subtraction
            3'b010: result = operandA & operandB; // AND
            3'b011: result = operandA | operandB; // OR
            3'b100: result = operandA ^ operandB; // XOR
            // Add more cases for other operations as needed
            default: result = 0; // Default case
        endcase

        // Set zeroFlag if the result is zero
        zeroFlag = (result == 0);

        // Set overflowFlag for signed addition and subtraction
        if (aluOp == 3'b000 || aluOp == 3'b001) begin
            // Calculate overflow: MSBs of operands are 0 and result MSB is 1, or
            // MSBs of operands are 1 and result MSB is 0
            overflowFlag = ((operandA[DATA_WIDTH-1] == 0 && operandB[DATA_WIDTH-1] == 0 && result[DATA_WIDTH-1] == 1) ||
                            (operandA[DATA_WIDTH-1] == 1 && operandB[DATA_WIDTH-1] == 1 && result[DATA_WIDTH-1] == 0));
        end
    end

endmodule