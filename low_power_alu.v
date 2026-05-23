module low_power_alu(
    input clk,
    input enable,
    input [7:0] A,
    input [7:0] B,
    input [2:0] opcode,

    output [7:0] result,
    output gated_clk,
    output [7:0] iso_A,
    output [7:0] iso_B,
    output [7:0] alu_out,
    output [7:0] bus_out,
    output invert
);

/* INTERNAL WIRES */

wire [7:0] alu_internal;
wire [7:0] bus_internal;

/* CLOCK GATING */

clock_gating CG (
    .clk(clk),
    .enable(enable),
    .gated_clk(gated_clk)
);

/* OPERAND ISOLATION */

operand_isolation OI (
    .A(A),
    .B(B),
    .opcode(opcode),
    .iso_A(iso_A),
    .iso_B(iso_B)
);

/* ALU */

alu_base ALU (
    .clk(gated_clk),
    .A(iso_A),
    .B(iso_B),
    .opcode(opcode),
    .result(alu_internal)
);

/* BUS INVERT */

bus_invert BI (
    .data_in(alu_internal),
    .prev_data(result),
    .data_out(bus_internal),
    .invert(invert)
);

/* OUTPUT ASSIGNMENTS */

assign alu_out = alu_internal;
assign bus_out = bus_internal;
assign result  = bus_internal;

endmodule