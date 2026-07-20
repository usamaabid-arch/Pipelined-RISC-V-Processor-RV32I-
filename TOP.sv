`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2026 04:23:08 PM
// Design Name: 
// Module Name: top
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

module top#(parameter N=32, D=32, width=32)(
input logic clk, reset    );

logic [1:0] alu_op, alu_op_ID;  
wire   branch, mem_rd, mem2reg, mem_write, alu_scr, reg_write, zero, sel_b, branch_ID, mem_rd_ID, mem2reg_ID, mem_write_ID; 
wire  branch_EX, mem_rd_EX, mem2reg_EX, mem_write_EX, alu_scr_ID, reg_write_ID, reg_write_WB,mem2reg_WB;
wire [N-1:0] pc_out, inst, data_w /* D_mux_out  */,  immout, mdata2/* R_mux_data2  */, data2, dmem_out/* in_mux_data_w  */,A0,A1,mux_out,data1, alu_out,inst_IF, pc_out_IF, immout_ID;
wire [N-1:0]  pc_out_ID,  Imm_ID , reg_write_EX, zero_EX, A1_EX,  alu_out_EX, data2_EX, Imm_EX, dmem_out_WB,alu_out_WB, Imm_reg_write, data1_ID, data2_ID;
wire [3:0] alu_ctrl;


    
pc pro( mux_out, clk, reset, pc_out );

instructionMemory INST(pc_out, inst_IF );

Reg_IF D1( clk, reset, pc_out,  inst_IF, pc_out_IF,  inst);

registerData regfile(inst, reg_write, reset, clk, data_w, Imm_reg_write, data1_ID, data2_ID );

Immediate_gen imm( inst, immout_ID);

control_path m_control (inst,branch_ID, mem_rd_ID, mem2reg_ID, mem_write_ID, alu_scr_ID, reg_write_ID, alu_op_ID );

Reg_ID D2(clk, reset,branch_ID, mem_rd_ID, mem2reg_ID, mem_write_ID, alu_scr_ID, reg_write_ID, pc_out_IF,  inst, data1_ID, data2_ID, immout_ID, alu_op_ID,
    pc_out_ID,  Imm_ID ,data1, data2, immout, branch_EX, mem_rd_EX, mem2reg_EX, mem_write_EX, alu_scr, reg_write_EX, alu_op);


Reg_EX D3( clk, reset,branch_EX, mem_rd_EX, mem2reg_EX, mem_write_EX, reg_write_EX, A1,zero_EX, alu_out, data2,Imm_ID, 
   A1_EX, zero,  alu_out_EX, data2_EX, Imm_EX, branch, mem_rd, mem2reg_WB, mem_write, reg_write_WB );

Reg_WB D4(clk, reset,mem2reg_WB,reg_write_WB, dmem_out_WB, alu_out_EX,Imm_EX,  dmem_out, alu_out_WB,Imm_reg_write, mem2reg,reg_write);


alu_control addr_control (alu_op, Imm_ID, alu_ctrl ); 

alu ADDR( alu_ctrl, data1, mdata2, alu_out, zero_EX ); 

data_memory storgge( alu_out_EX, data2_EX, mem_write, mem_rd, clk, reset,  dmem_out_WB );

mux im_ALU(.In1(data2),  .In2(immout),  .sel(alu_scr),   .out(mdata2) );   
    
 mux data_mem(.In1(alu_out_WB), .In2(dmem_out),  .sel(mem2reg), .out(data_w));   
 
 adder pc_4(.In1(pc_out),.In2(32'd4), .sum(A0) );   


 adder pc_j(.In1(pc_out_ID),.In2(immout),  .sum(A1));
    
mux add_pc(.In1(A0),.In2(A1_EX),.sel(sel_b), .out(mux_out) ); 
    
 AND_B m_se( .a(branch),.b(zero), .c(sel_b)  ); 



      
endmodule