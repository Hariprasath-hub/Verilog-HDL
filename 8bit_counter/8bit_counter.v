timescale 1ns / 1ps
module counter(
input wire clk,
    input wire reset,
    input wire load,
    input wire [7:0] preset,
    output wire tcount

    );
    reg [7:0] counter;

always @(posedge clk or posedge reset)
begin
    if (reset)
        counter <= 8'h00;
    else if (load)
        counter <= preset;
    else if (counter == 8'hFF)
        counter <= 8'h00;
    else
        counter <= counter + 1;
end

assign tcount = (counter == 8'hFF);

endmodule

