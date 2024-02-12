`timescale 1ns / 1ps

module counter_tb;
reg clk;
reg reset;
reg load;
reg [7:0] preset;
wire tcount;

counter dut (
    .clk(clk),
    .reset(reset),
    .load(load),
    .preset(preset),
    .tcount(tcount)
);

initial begin
    clk = 0;
    reset = 1;
    load = 0;
    preset = 8'h00;
    #10 reset = 0;
end

always #5 clk = ~clk;

initial begin
    // Test without load
    #100;
    load = 0;
    // Test with load
    #10 preset = 8'hFF;
    #10 load = 1;
    #10 preset = 8'h0A;
    #100 preset = 8'h00;
    #100;
    $stop;
end

endmodule

    
