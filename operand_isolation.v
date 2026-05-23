module operand_isolation(
    input [7:0] A,
    input [7:0] B,
    input [2:0] opcode,
    output [7:0] iso_A,
    output [7:0] iso_B
);

assign iso_A = (opcode <= 3'b100) ? A : 8'b00000000;
assign iso_B = (opcode <= 3'b100) ? B : 8'b00000000;

endmodule