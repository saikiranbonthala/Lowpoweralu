module alu_base(
    input clk,
    input [7:0] A,
    input [7:0] B,
    input [2:0] opcode,
    output reg [7:0] result
);

always @(posedge clk)
begin
    case(opcode)

        3'b000: result <= A + B;   // ADD
        3'b001: result <= A - B;   // SUB
        3'b010: result <= A & B;   // AND
        3'b011: result <= A | B;   // OR
        3'b100: result <= A ^ B;   // XOR

        default: result <= 8'b00000000;

    endcase
end

endmodule