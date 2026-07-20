`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2026 04:24:19 PM
// Design Name: 
// Module Name: alu
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

module alu#(parameter N=32)( 
input  [3:0] alu_ctrl, 
input  [N-1:0] data1, mdata2, 
output reg [N-1:0] alu_out, 
output reg zero_EX              
// = (alu_out == 0) 
); 
// alu_ctrl: 0=AND 1=OR 2=ADD 6=SUB 7=SLT 8=SGT 12=NOR
 
    always_comb  begin
    case(alu_ctrl)
    
        0: alu_out=data1 & mdata2;
        1: alu_out=data1 | mdata2;
        2: alu_out=data1+mdata2;
        6: alu_out=data1 - mdata2;
//        7: alu_out=($signed(data1)<$signed(mdata2))? 32'd1 : 32'd0 ;
//        8: alu_out=($signed(data1)>$signed(mdata2))? 32'd1 : 32'd0 ;
       7:  alu_out=($signed(data1) < $signed(mdata2));
        8:  alu_out=($signed(data1) > $signed(mdata2));
        12: alu_out=~(data1|mdata2);
        15:  alu_out= data1<<mdata2;  
       default: alu_out = {N{1'b0}};
    endcase
    if(alu_out == 0) zero_EX=1;
    else zero_EX=0;
    
    end


endmodule
