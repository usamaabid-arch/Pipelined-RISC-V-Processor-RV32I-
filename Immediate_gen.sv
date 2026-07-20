`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2026 04:29:00 PM
// Design Name: 
// Module Name: Immediate_gen
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


module Immediate_gen#(parameter N=32)( 
input  [N-1:0] inst, 
output reg [N-1:0] immout_ID 
    );
    logic [6:0] opcode;
    logic [11:0] c_imm;
    assign opcode=inst[6:0];
    // once check 
    always_comb begin

    case(opcode)
    7'b0000011,7'b0010011,7'b1100111 : immout_ID = {{20{inst[31]}},inst[31:20]}; // I type
    7'b0100011                       : immout_ID = {{20{inst[31]}},inst[31:25],inst[11:7]}; // S type
    7'b1100011                       : immout_ID = {{19{inst[31]}},inst[31],inst[7], inst[30:25] , inst[11:8], 1'b0} ; // B type
    7'b0010111,7'b0110111            : immout_ID = {inst[31:12],12'b0};
    7'b1101111: immout_ID = {{11{inst[31]}}, inst[31], inst[19:12], inst[20], inst[30:21], 1'b0 } ; // J,U type

    default : immout_ID = 32'd0;
endcase

end

endmodule

