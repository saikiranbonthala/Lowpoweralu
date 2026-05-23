module tb_low_power_alu;

reg clk;
reg enable;
reg [7:0] A;
reg [7:0] B;
reg [2:0] opcode;

wire [7:0] result;
wire gated_clk;
wire [7:0] iso_A;
wire [7:0] iso_B;
wire [7:0] alu_out;
wire [7:0] bus_out;
wire invert;

low_power_alu DUT(
    .clk(clk),
    .enable(enable),
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .gated_clk(gated_clk),
    .iso_A(iso_A),
    .iso_B(iso_B),
    .alu_out(alu_out),
    .bus_out(bus_out),
    .invert(invert)
);

/* clock */

always #5 clk = ~clk;

initial
begin

clk = 0;
enable = 1;

/* ADD */

A = 8'b00001111;
B = 8'b11110000;
opcode = 3'b000;
#20;

/* AND */

opcode = 3'b010;
#20;

/* XOR */

opcode = 3'b100;
#20;

/* CLOCK GATING */

enable = 0;
#40;

$stop;

end

endmodule