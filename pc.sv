`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2026 04:19:09 PM
// Design Name: 
// Module Name: pc
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
module pc ( 
input  logic [31:0] mux_out, 
input  logic clk, reset, 
output logic [31:0] pc_out 
    );
    
    always_ff@(posedge clk or posedge  reset) begin
    if(reset) pc_out<=0;
    else
    pc_out<=mux_out;
    
    end
endmodule
