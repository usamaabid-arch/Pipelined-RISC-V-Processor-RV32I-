`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2026 04:27:18 PM
// Design Name: 
// Module Name: control_path
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

module control_path#(parameter N=32)(
input  [N-1:0] inst,
output reg  branch_ID, mem_rd_ID, mem2reg_ID, mem_write_ID, alu_scr_ID, reg_write_ID, 
output reg [1:0] alu_op_ID 
    );
    
    always_comb begin
    case(inst[6:0])
        7'b0000011:begin  // load
        alu_op_ID=2'b00; branch_ID=0; mem_write_ID=0; mem_rd_ID=1; reg_write_ID=1; mem2reg_ID=1; alu_scr_ID=1;  
        end
        
        7'b0010011:begin
        alu_op_ID=2'b11; branch_ID=0; mem_write_ID=0; mem_rd_ID=0; reg_write_ID=1; mem2reg_ID=0; alu_scr_ID=1;  
        end
        
        7'b0110011:begin //R-Type (add, sub)
        alu_op_ID=2'b10; branch_ID=0; mem_write_ID=0; mem_rd_ID=0; reg_write_ID=1; mem2reg_ID=0; alu_scr_ID=0;  
        end
        
        7'b0100011:begin  // sw
        alu_op_ID=2'b00; branch_ID=0; mem_write_ID=1; mem_rd_ID=0; reg_write_ID=0; mem2reg_ID=1'b0; alu_scr_ID=1;  //mem2reg_ID=1'b?;
        end
        
        
        7'b1100011:begin  // beq
        alu_op_ID=2'b01; branch_ID=1; mem_write_ID=0; mem_rd_ID=0; reg_write_ID=0; mem2reg_ID=1'b0; alu_scr_ID=0;  //mem2reg_ID=1'b?;
        end
        
        default: begin
        alu_op_ID=2'b??; branch_ID=1'b?; mem_write_ID=1'b?; mem_rd_ID=1'b?; reg_write_ID=1'b?; mem2reg_ID=1'b?; alu_scr_ID=1'b?;  
        end
    endcase
    end
    
    
endmodule

