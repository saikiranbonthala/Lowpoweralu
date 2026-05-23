module bus_invert(
    input [7:0] data_in,
    input [7:0] prev_data,
    output reg [7:0] data_out,
    output reg invert
);

integer count;
integer i;

always @(*)
begin
    count = 0;

    for(i = 0; i < 8; i = i + 1)
    begin
        if(data_in[i] != prev_data[i])
            count = count + 1;
    end

    if(count > 4)
    begin
        data_out = ~data_in;
        invert = 1'b1;
    end
    else
    begin
        data_out = data_in;
        invert = 1'b0;
    end

end

endmodule