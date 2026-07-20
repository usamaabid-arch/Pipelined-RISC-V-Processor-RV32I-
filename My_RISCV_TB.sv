`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2026 04:49:56 PM
// Design Name: 
// Module Name: My_RISCV_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module My_RISCV_TB;
 logic clk,reset;
top dut(.clk(clk), .reset(reset));

initial
begin
clk =0;
forever #20 clk = ~clk;
end

initial
begin
reset=1; #50;
reset=0;
#3000;
 
end
endmodule