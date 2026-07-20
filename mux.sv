`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2026 04:33:55 PM
// Design Name: 
// Module Name: mux
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

module mux#(parameter N=32)(
input logic [N-1: 0]In1,In2,
input logic sel,
output logic [N-1: 0] out
    );
    
always_comb begin
case(sel)

    0: out=In1;
    1: out=In2;
   // default: out=0;
endcase 
end
endmodule
